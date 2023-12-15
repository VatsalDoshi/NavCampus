//
//  LookAroundView.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

// LookAroundView.swift
import SwiftUI
import MapKit

struct LookAroundView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.mapType = .standard
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: 200, pitch: 70, heading: 0)
        uiView.setCamera(camera, animated: true)
        uiView.showsBuildings = true
        uiView.isPitchEnabled = true
    }
}


