//
//  Weekday.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

struct Weekday: Mappable {
    
    var from: String?
    var to: String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        from           <- map["from"]
        to             <- map["to"]
        
    }
}
