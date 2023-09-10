//
//  LocationModel.swift
//  Africa
//
//  Created by Amin on 07/09/2023.
//

import Foundation
import MapKit
struct NationalParkLocation:Codable,Identifiable{
    let id:String
    let name:String
    let image:String
    let latitude:Double
    let longitude:Double
    
    // Computed Property
    var location:CLLocationCoordinate2D{
        .init(latitude: latitude, longitude: longitude)
    }
    
}
