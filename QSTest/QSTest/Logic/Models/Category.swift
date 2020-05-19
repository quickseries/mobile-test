//
//  Category.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

struct Category: Codable {
    enum Slug: String, Codable {
        case restaurants
        case vacationSpots = "vacation-spots"
    }
    
    let id: String
    let slug: Slug
    let customModuleEid: String
    let eid: String
    let title: String
    let description: String?
    let v: Int
    let active: Bool
    let created: Date
    let updated: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug
        case customModuleEid = "custom_module_eid"
        case eid
        case title
        case description
        case v = "__v"
        case active = "_active"
        case created = "created_at"
        case updated = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.slug = try container.decode(Slug.self, forKey: .slug)
        self.customModuleEid = try container.decode(String.self, forKey: .customModuleEid)
        self.eid = try container.decode(String.self, forKey: .eid)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.v = try container.decode(Int.self, forKey: .v)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.created = try container.decode(Date.self, forKey: .created)
        self.updated = try container.decode(Date.self, forKey: .updated)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.slug, forKey: .slug)
        try container.encode(self.customModuleEid, forKey: .customModuleEid)
        try container.encode(self.eid, forKey: .eid)
        try container.encode(self.title, forKey: .title)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.active, forKey: .active)
        try container.encode(self.created, forKey: .created)
        try container.encode(self.updated, forKey: .updated)
    }
    
    // MARK: - Init for mocking
    init(id: String,
         slug: Slug,
         customModuleEid: String,
         eid: String,
         title: String,
         description: String?,
         v: Int,
         active: Bool,
         created: Date,
         updated: Date) {
        self.id = id
        self.slug = slug
        self.customModuleEid = customModuleEid
        self.eid = eid
        self.title = title
        self.description = description
        self.v = v
        self.active = active
        self.created = created
        self.updated = updated
    }
}

typealias Categories = [Category]
