//
//  DirectionsView.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

// DirectionsView.swift
//import SwiftUI
//import MapKit
//
//struct DirectionsView: View {
//    var destination: CLLocationCoordinate2D
//    @State private var directions: [String] = []
//    @State private var isCalculatingDirections = false
//
//    var body: some View {
//        VStack {
//            if isCalculatingDirections {
//                ProgressView("Calculating directions...")
//            } else {
//                List(directions, id: \.self) { direction in
//                    Text(direction)
//                }
//            }
//        }
//        .onAppear(perform: calculateDirections)
//    }
//
//    private func calculateDirections() {
//        isCalculatingDirections = true
//        let request = MKDirections.Request()
//        request.source = MKMapItem.forCurrentLocation()
//        let destinationPlacemark = MKPlacemark(coordinate: destination)
//        request.destination = MKMapItem(placemark: destinationPlacemark)
//        request.transportType = .automobile
//
//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            isCalculatingDirections = false
//            guard let route = response?.routes.first else { return }
//            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
//        }
//    }
//}
