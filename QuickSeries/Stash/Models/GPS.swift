//
//  GPS.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/27/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

class GPS: Object,Mappable {

    @objc dynamic var latitude = ""
    @objc dynamic var longitude = ""

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
