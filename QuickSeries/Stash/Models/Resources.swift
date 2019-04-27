//
//  Resources.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/26/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

class Resources: Object,Mappable {
    
    @objc dynamic var _id = ""
    @objc dynamic var slug = ""
    @objc dynamic var eid = ""
    @objc dynamic var photo = ""
    @objc dynamic var title = ""
    @objc dynamic var cat_description = ""
    @objc dynamic var category_eid = ""
    @objc dynamic var _active = false
    @objc dynamic var socialMedia:SocialMedia?
    @objc dynamic var contactInfo:ContactInfo?
    @objc dynamic var bizHours:bizHours?
    var arrAddresses = List<Address>()

    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }
    
    func mapping(map: Map) {
        
        _id <- map["_id"]
        slug <- map["slug"]
        eid <- map["eid"]
        photo <- map["photo"]
        title <- map["title"]
        cat_description  <- map["description"]
        category_eid <- map["category_eid"]
        _active <- map["_active"]
        socialMedia <- map["socialMedia"]
        bizHours <- map["bizHours"]
        contactInfo <- map["contactInfo"]
        arrAddresses <- (map["addresses"], ListTransform<Address>())
    }
}
