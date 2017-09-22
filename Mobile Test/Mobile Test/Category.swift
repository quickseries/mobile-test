//
//  Category.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import Foundation

enum CategoryFields: String {
    case id = "_id"
    case updatedAt = "updated_at"
    case slug = "slug"
    case customModuleEID = "custom_module_eid"
    case eid = "eid"
    case title = "title"
    case v = "__v"
    case active = "_active"
    case createdAt = "created_at"
    case categoryDescription = "description"
}

class Category:NSObject {
    
    var id:String?
    var updatedAt:String?
    var slug:String?
    var customModuleEID:String?
    var eid:String?
    var title:String?
    var v:Int?
    var active:Bool?
    var createdAt:String?
    var categoryDescription:String?
    
    required init(json: [String:Any]){
        self.id = json[CategoryFields.id.rawValue] as? String
        self.updatedAt = json[CategoryFields.updatedAt.rawValue] as? String
        self.slug = json[CategoryFields.slug.rawValue] as? String
        self.customModuleEID = json[CategoryFields.customModuleEID.rawValue] as? String
        self.eid = json[CategoryFields.eid.rawValue] as? String
        self.title = json[CategoryFields.title.rawValue] as? String
        self.v = json[CategoryFields.v.rawValue] as? Int
        self.active = json[CategoryFields.active.rawValue] as? Bool
        self.createdAt = json[CategoryFields.createdAt.rawValue] as? String
        self.categoryDescription = json[CategoryFields.categoryDescription.rawValue] as? String
    }
}
