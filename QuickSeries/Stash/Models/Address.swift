//
//  Address.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/26/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

class Address:  Object,Mappable {
    
    @objc dynamic var label = ""
    @objc dynamic var address1 = ""
    @objc dynamic var city = ""
    @objc dynamic var zipCode = ""
    @objc dynamic var state = ""
    @objc dynamic var country = ""
    @objc dynamic var gps:GPS?

    required convenience init?(map: Map) {
        self.init()
    }
        
    func mapping(map: Map) {
        
        label <- map["label"]
        address1 <- map["address1"]
        city <- map["city"]
        zipCode <- map["zipCode"]
        state <- map["state"]
        country <- map["country"]
        gps <- map["gps"]
    }
    
}
