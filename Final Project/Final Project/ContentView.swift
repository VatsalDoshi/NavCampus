

// ContentView.swift
import SwiftUI
import MapKit

struct DepartmentLocation {
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct DepartmentAnnotation: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var title: String?
}

struct ContentView: View {
    @State private var query: String = ""
    @State private var departmentAnnotations: [DepartmentAnnotation] = []
    @ObservedObject private var locationManager = LocationManager.shared
    @State private var selectedAnnotation: DepartmentAnnotation?
    @State private var showStreetView: Bool = false
    @State private var showRoute: Bool = false
//    @State private var showDirections: Bool = false
    
    let departmentData: [String: [DepartmentLocation]] = [
        // Add your department data here
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
    
    private func searchDepartment() {
        // ... existing search implementation ...
        if let departmentLocations = departmentData[query] {
            departmentAnnotations = departmentLocations.map { location in
                DepartmentAnnotation(coordinate: location.coordinate, title: location.name)
            }
        } else {
            departmentAnnotations = []
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Department", text: $query, onCommit: searchDepartment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Always display the MapView
                MapView(region: $locationManager.region, annotations: departmentAnnotations, selectedAnnotation: $selectedAnnotation)
                    .frame(height: 300)
                    .cornerRadius(12)
                    .padding()

                // Controls for route and street view
                if let selectedAnnotation = selectedAnnotation {
                    Button("Show Route") {
                        showRoute.toggle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)

                    Button("Show Street View") {
                        showStreetView.toggle()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }

                // Conditionally show RouteMapView or LookAroundView
                Group {
                    if showRoute, let destination = selectedAnnotation?.coordinate {
                        RouteMapView(destination: destination, region: $locationManager.region)
                            .frame(height: 300)
                            .transition(.slide)
                    }

                    if showStreetView, let coordinate = selectedAnnotation?.coordinate {
                        LookAroundView(coordinate: coordinate)
                            .frame(height: 300)
                            .transition(.slide)
                    }
                }
            }
            .navigationTitle("Department Locations")
        }
    }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

