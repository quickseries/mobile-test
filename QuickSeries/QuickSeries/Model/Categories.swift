//
//  Categories.swift
//  QuickSeries
//
//  Created by Parth Patel on 13/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation

struct Categories : Codable {
    
    var id : String?
    var updatedAt : String?
    var slug : String?
    var customModuleEid : String?
    var eId : String?
    var title : String?
    var description : String?
    var v : Int?
    var active : Bool?
    var createdAt : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case updatedAt = "updated_at"
        case slug
        case customModuleEid = "custom_module_eid"
        case eId = "eid"
        case title
        case description
        case v = "__v"
        case active = "_active"
        case createdAt = "created_at"
        
    }
    
}
