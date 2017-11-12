//
//  ContactInfo.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

struct ContactInfo: Mappable {

    var website : [String]?
    var email : [String]?
    var phoneNumber : [String]?
    var faxNumber : [String]?
    var tollFree : [String]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        website           <- map["website"]
        email             <- map["email"]
        phoneNumber       <- map["phoneNumber"]
        faxNumber       <- map["faxNumber"]
        tollFree       <- map["tollFree"]
    }
}
