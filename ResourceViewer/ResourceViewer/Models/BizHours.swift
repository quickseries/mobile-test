//
//  BizHours.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

struct BizHours:Mappable {
    
    var sunday: Weekday?
    var monday: Weekday?
    var tuesday: Weekday?
    var wednesday: Weekday?
    var thursday: Weekday?
    var friday: Weekday?
    var saturday: Weekday?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        sunday      <- map["sunday"]
        monday      <- map["monday"]
        tuesday     <- map["tuesday"]
        wednesday   <- map["wednesday"]
        thursday    <- map["thursday"]
        friday      <- map["friday"]
        saturday    <- map["saturday"]
    }
}
