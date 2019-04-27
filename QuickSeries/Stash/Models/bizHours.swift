//
//  bizHours.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/27/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

class bizHours: Object,Mappable {
    
    @objc dynamic var sunday:Times?
    @objc dynamic var monday:Times?
    @objc dynamic var tuesday:Times?
    @objc dynamic var wednesday:Times?
    @objc dynamic var thursday:Times?
    @objc dynamic var friday:Times?
    @objc dynamic var saturday:Times?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        sunday <- map["sunday"]
        monday <- map["monday"]
        tuesday <- map["tuesday"]
        wednesday <- map["wednesday"]
        thursday <- map["thursday"]
        friday <- map["friday"]
        saturday <- map["saturday"]
    }
}

