//
//  MapView.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

// MapView.swift
import SwiftUI
import MapKit

struct MapView: View {
    @Binding var region: MKCoordinateRegion
    var annotations: [DepartmentAnnotation]
    @Binding var selectedAnnotation: DepartmentAnnotation?

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotations) { annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                Button(action: {
                    selectedAnnotation = annotation
                }) {
                    VStack {
                        Text(annotation.title ?? "")
                            .font(.caption)
                            .padding(5)
                            .background(Color.white)
                            .cornerRadius(10)
                            .opacity(0.8)

                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}
