//
//  Addresses.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

struct Addresses: Mappable {
    
    var address1 : String?
    var label : String?
    var zipCode : String?
    var city : String?
    var state : String?
    var country : String?
    var gps : Gps?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        address1   <- map["address1"]
        label      <- map["label"]
        zipCode             <- map["zipCode"]
        city             <- map["city"]
        state             <- map["state"]
        country             <- map["country"]
        gps             <- map["gps"]
    }
}


