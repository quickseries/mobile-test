//
//  Categories.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/25/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import Foundation

struct Category: Codable {
    var id: String
    var updatedAt: String
    var slug: String
    var customModuleEid: String
    var eid, title: String
    var description: String?
    var v: Int
    var active: Bool
    var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case updatedAt = "updated_at"
        case slug
        case customModuleEid = "custom_module_eid"
        case eid, title, description
        case v = "__v"
        case active = "_active"
        case createdAt = "created_at"
    }
}

