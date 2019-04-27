//
//  Categories.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/25/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

class Categories: Object,Mappable {

    @objc dynamic var _id = ""
    @objc dynamic var slug = ""
    @objc dynamic var custom_module_eid = ""
    @objc dynamic var eid = ""
    @objc dynamic var title = ""
    @objc dynamic var cat_description = ""
    @objc dynamic var _active = false

    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "_id"
    }

    func mapping(map: Map) {
        _id <- map["_id"]
        slug <- map["slug"]
        custom_module_eid <- map["custom_module_eid"]
        eid <- map["eid"]
        title <- map["title"]
        cat_description  <- map["description"]
        _active <- map["_active"]
    }
}
