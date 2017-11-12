//
//  BaseResource.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

class Resource: Mappable {
    
    var _id : String?
    var slug : String?
    var eid : String?
    var photo : String?
    var title : String?
    var description : String?
    var category_eid : String?
    var __v : Int?
    var _active : String?
    var updated_at : String?
    var created_at : String?
    var socialMedia : SocialMedia?
    var addresses : [Addresses]?
    var contactInfo : ContactInfo?
    var freeText : [FreeText]?
    var bizHours : BizHours?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        _id               <- map["_id"]
        slug              <- map["slug"]
        eid               <- map["eid"]
        photo             <- map["photo"]
        title             <- map["title"]
        description       <- map["description"]
        __v               <- map["__v"]
        _active           <- map["_active"]
        updated_at        <- map["updated_at"]
        created_at        <- map["creatd_at"]
        socialMedia       <- map["socialMedia"]
        addresses         <- map["addresses"]
        contactInfo       <- map["contactInfo"]
        freeText          <- map["freeText"]
        bizHours          <- map["bizHours"]
    }
}
