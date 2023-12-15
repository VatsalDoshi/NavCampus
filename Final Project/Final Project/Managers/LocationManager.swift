//
//  LocationManager.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

import Foundation
import MapKit

enum LocationError: Error {
    case authorizationDenied
    case authorizationRestricted
    case unknownLocation
    case accessDenied
    case network
    case operationFailed

    var errorDescription: String {
        switch self {
        case .authorizationDenied:
            return "Location access denied."
        case .authorizationRestricted:
            return "Location access restricted."
        case .unknownLocation:
            return "Unknown location."
        case .accessDenied:
            return "Access denied."
        case .network:
            return "Network failed."
        case .operationFailed:
            return "Operation failed."
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    static let shared = LocationManager()
    @Published var region: MKCoordinateRegion = MKCoordinateRegion()
    var error: LocationError?

    private override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.requestWhenInUseAuthorization()
    }

    func start() {
        manager.startUpdatingLocation()
    }
}

extension LocationManager {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        region = MKCoordinateRegion(center: location.coordinate,
                                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            start()
        case .denied:
            error = .authorizationDenied
        case .restricted:
            error = .authorizationRestricted
        @unknown default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle the error accordingly
        if let clError = error as? CLError {
            switch clError.code {
                case .locationUnknown:
                    self.error = .unknownLocation
                case .denied:
                    self.error = .accessDenied
                case .network:
                    self.error = .network
                default:
                    self.error = .operationFailed
            }
        }
        
    
    }
}
