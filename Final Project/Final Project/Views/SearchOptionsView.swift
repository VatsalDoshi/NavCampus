//
//  SearchOptionsView.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

import SwiftUI
import MapKit



let departmentData: [String: [DepartmentLocation]] = [
    "Biology": [
        DepartmentLocation(name: "Biomimetic Underwater Robot Program", coordinate: CLLocationCoordinate2D(latitude: 42.44746851640155, longitude: -70.92724547613453)),
        DepartmentLocation(name: "Monaghan Lab", coordinate: CLLocationCoordinate2D(latitude: 42.34004135664277, longitude: -71.08872647398816)),
        DepartmentLocation(name: "O'Malley Lab", coordinate: CLLocationCoordinate2D(latitude: 42.33989816583664, longitude: -71.08700874515286)),
        DepartmentLocation(name: "Action Lab", coordinate: CLLocationCoordinate2D(latitude: 42.33989816583664, longitude: -71.08700874515286)),
        DepartmentLocation(name: "Cram Lab", coordinate: CLLocationCoordinate2D(latitude: 42.34007367796329, longitude: -71.08876266049433))
    ],
    "Chemistry": [
        DepartmentLocation(name: "Beuning Lab", coordinate: CLLocationCoordinate2D(latitude: 42.33980266599323, longitude: -71.08634474515276)),
        DepartmentLocation(name: "Engen Lab", coordinate: CLLocationCoordinate2D(latitude: 42.340324565473736, longitude: -71.09515344755823)),
        DepartmentLocation(name: "Zhang Group", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707)),
        DepartmentLocation(name: "SunnyLand", coordinate: CLLocationCoordinate2D(latitude: 42.33980266599323, longitude: -71.08634474515276)),
        DepartmentLocation(name: "Manetsch Lab", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707))
    ],
    "Mathematics": [
        DepartmentLocation(name: "Algebra", coordinate: CLLocationCoordinate2D(latitude: 42.33989816583664, longitude: -71.08700874515286)),
        DepartmentLocation(name: "Analysis and Geometry", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707)),
        DepartmentLocation(name: "Mathematical Physics", coordinate: CLLocationCoordinate2D(latitude: 42.33980266599323, longitude: -71.08634474515276)),
        DepartmentLocation(name: "Combinatorics and Discrete Math", coordinate: CLLocationCoordinate2D(latitude: 42.34007367796329, longitude: -71.08876266049433)),
        DepartmentLocation(name: "Algebraic Geometry", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707))
    ],
    "Marine": [
        DepartmentLocation(name: "Detrich Lab", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707)),
        DepartmentLocation(name: "Lotterhos Lab", coordinate: CLLocationCoordinate2D(latitude: 42.33980266599323, longitude: -71.08634474515276)),
        DepartmentLocation(name: "Vollmer Lab", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707)),
        DepartmentLocation(name: "Bowen Lab", coordinate: CLLocationCoordinate2D(latitude: 42.33989816583664, longitude: -71.08700874515286)),
        DepartmentLocation(name: "Grabowski Lab", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707))
    ],
    "Physics": [
        DepartmentLocation(name: "Astrophysics and Cosmology", coordinate: CLLocationCoordinate2D(latitude: 42.33980266599323, longitude: -71.08634474515276)),
        DepartmentLocation(name: "Experimental Nanophysics", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707)),
        DepartmentLocation(name: "Experimental Particle Physics", coordinate: CLLocationCoordinate2D(latitude: 42.34007367796329, longitude: -71.08876266049433)),
        DepartmentLocation(name: "Network Science", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707)),
        DepartmentLocation(name: "Theoretical High Energy Physics", coordinate: CLLocationCoordinate2D(latitude: 42.33989816583664, longitude: -71.08700874515286))
    ],
    "Psychology": [
        DepartmentLocation(name: "Aggression Lab", coordinate: CLLocationCoordinate2D(latitude: 42.3377647445476, longitude: -71.08694012789707)),
        DepartmentLocation(name: "Language and Mind Lab", coordinate: CLLocationCoordinate2D(latitude: 42.33980266599323, longitude: -71.08634474515276)),
        DepartmentLocation(name: "CESAR Lab", coordinate: CLLocationCoordinate2D(latitude: 42.34007367796329, longitude: -71.08876266049433)),
        DepartmentLocation(name: "Vision Lab", coordinate: CLLocationCoordinate2D(latitude: 42.33989816583664, longitude: -71.08700874515286)),
        DepartmentLocation(name: "The CTNI", coordinate: CLLocationCoordinate2D(latitude: 42.33980266599323, longitude: -71.08634474515276))
    ]
]



struct SearchOptionsView: View {
    let searchOptions = ["Biology": "leaf", "Chemistry": "atom", "Mathematics": "compass.drawing", "Marine": "tortoise.fill", "Physics": "globe.central.south.asia", "Psychology": "brain.filled.head.profile"]

    let onSelected: ([DepartmentLocation]) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(searchOptions.sorted(by: <), id: \.0) { key, value in
                    Button(action: {
                        let selectedLocations = departmentData[key] ?? []
                        onSelected(selectedLocations)
                    }, label: {
                        HStack {
                            Image(systemName: value)
                            Text(key)
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 236/255, green: 240/255, blue: 241/255, opacity: 1.0))
                    .foregroundStyle(.black)
                    .padding(4)
                }
            }
        }
    }
}



#Preview {
    SearchOptionsView(onSelected: { _ in })
}
