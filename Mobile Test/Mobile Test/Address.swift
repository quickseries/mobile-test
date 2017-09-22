//
//  Address.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import Foundation
import CoreLocation

enum AddressFields:String{
    case label = "label"
    case address1 = "address1"
    case city = "city"
    case zipCode = "zipCode"
    case state = "state"
    case country = "country"
    case gps = "gps"
}

class Address: NSObject {
    var label:String?
    var address1:String?
    var city:String?
    var zipCode:String?
    var state:String?
    var country:String?
    var gps: CLLocationCoordinate2D?
    
    required init(json: [String:Any]) {
        self.label = json[AddressFields.label.rawValue] as? String
        self.address1 = json[AddressFields.address1.rawValue] as? String
        self.city = json[AddressFields.city.rawValue] as? String
        self.zipCode = json[AddressFields.zipCode.rawValue] as? String
        self.state = json[AddressFields.state.rawValue] as? String
        self.country = json[AddressFields.country.rawValue] as? String
        
        if let gps = json[AddressFields.gps.rawValue] as? [String:Any]{
            if let lat = gps["latitude"] as? String , let long = gps["longitude"] as? String{
                self.gps = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
            }
        }
    }
}
