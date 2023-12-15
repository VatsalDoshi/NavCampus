//
//  PreviewData.swift
//  Final Project
//
//  Created by Vatsal Doshi on 12/14/23.
//

import Foundation
import MapKit
import Contacts

struct PreviewData {
    
    static var neu: MKMapItem {
        
        let coordinate = CLLocationCoordinate2D(latitude: 42.33918801796435, longitude: -71.08824670331418)
        
        let addressDictionary: [String: Any] = [
            CNPostalAddressStreetKey: "360 Huntington Avenue",
            CNPostalAddressCityKey: "Boston",
            CNPostalAddressStateKey: "MA",
            CNPostalAddressPostalCodeKey: "02215",
            CNPostalAddressCountryKey: "United States"
        ]
        
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Northeastern University"
        return mapItem
    }
}
