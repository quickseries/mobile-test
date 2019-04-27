//
//  ContactInfo.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/26/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

class ContactInfo: Object,Mappable {
    
    var website = List<String>()
    var email = List<String>()
    var faxNumber = List<String>()
    var tollFree = List<String>()
    var phoneNumber = List<String>()

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        website <- (map["website"], RealmTransform())
        email <- (map["email"], RealmTransform())
        faxNumber <- (map["faxNumber"], RealmTransform())
        tollFree <- (map["tollFree"], RealmTransform())
        phoneNumber <- (map["phoneNumber"], RealmTransform())

    }
    
}
