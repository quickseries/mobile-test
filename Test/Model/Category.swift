//
//  Category.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

struct Category: Decodable {
    //
    // MARK: - Variables And Properties
    //
    var id: String!
    var slug: String!
    var custom_module_eid: String!
    var eid: String!
    var title: String!
    var desc: String?
    var active: Bool!
    var created_At: Date!
    var updated_At: Date!
    var v: Int!
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug = "slug"
        case custom_module_eid = "custom_module_eid"
        case eid = "eid"
        case title = "title"
        case description = "description"
        case active = "_active"
        case created_At = "created_at"
        case updated_At = "updated_at"
        case v = "__v"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.custom_module_eid = try container.decode(String.self, forKey: .custom_module_eid)
        self.eid = try container.decode(String.self, forKey: .eid)
        self.title = try container.decode(String.self, forKey: .title)
        self.desc = try container.decodeIfPresent(String.self, forKey: .description)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.created_At = try container.decode(Date.self, forKey: .created_At)
        self.updated_At = try container.decode(Date.self, forKey: .updated_At)
        self.v = try container.decode(Int.self, forKey: .v)
    }
}
