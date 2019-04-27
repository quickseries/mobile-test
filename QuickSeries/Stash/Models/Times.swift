//
//  Times.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/27/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

class Times: Object,Mappable {

    @objc dynamic var to = ""
    @objc dynamic var from = ""

    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        to <- map["to"]
        from <- map["from"]
    }
}
