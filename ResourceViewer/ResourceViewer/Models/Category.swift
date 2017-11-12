//
//  Category.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

struct Category: Mappable {
    
    var _id: String?
    var updated_at: String?
    var slug: String?
    var custom_module_eid: String?
    var eid: String?
    var title: String?
    var description: String?
    var __v: Int?
    var _active: Bool?
    var created_at: String?

    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        _id               <- map["_id"]
        updated_at        <- map["updated_at"]
        slug              <- map["slug"]
        custom_module_eid <- map["custom_module_eid"]
        eid               <- map["eid"]
        title             <- map["title"]
        description       <- map["description"]
        __v               <- map["__v"]
        _active           <- map["_active"]
        created_at        <- map["creatd_at"]
        
    }
}
