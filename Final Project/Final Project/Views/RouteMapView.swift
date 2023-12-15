//
//  RouteMapView.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

// RouteMapView.swift
import SwiftUI
import MapKit

struct RouteMapView: UIViewRepresentable {
    var destination: CLLocationCoordinate2D
    @Binding var region: MKCoordinateRegion

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)

        let request = MKDirections.Request()
        request.source = MKMapItem.forCurrentLocation()
        let destinationPlacemark = MKPlacemark(coordinate: destination)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                uiView.addOverlay(route.polyline)
                uiView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: RouteMapView

        init(_ parent: RouteMapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 3
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}

