//
//  Gps.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

struct Gps: Mappable {
    
    var latitude : Double?
    var longitude : Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        latitude  <- map["latitude"]
        longitude <- map["longitude"]
    }
}
