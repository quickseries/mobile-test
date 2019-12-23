//
//  Resource.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-20.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import Foundation

struct Resource: Decodable {
    
    //
    // MARK: - Variables And Properties
    //
    var id: String
    var slug: String
    var eid: String
    var title: String
    var desc: String
    var businessHours: [String: [String:String]]?
    var category_eid: String
    var v: Int
    var photo: String
    var active: Bool
    var updated_at: Date
    var created_at: Date
    var locations: [Addresses]?
    var contactInfo: [ContactInfo]
    var socialMedia: [SocialMedia]?

    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug
        case eid
        case title
        case desc = "description"
        case businessHours = "bizHours"
        case category_eid
        case v = "__v"
        case photo
        case active = "_active"
        case updated_at
        case created_at
        case addresses = "addresses"
        case contactInfo
        case socialMedia
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.eid = try container.decode(String.self, forKey: .eid)
        self.title = try container.decode(String.self, forKey: .title)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.businessHours = try container.decodeIfPresent(Dictionary.self, forKey: .businessHours)
        self.category_eid = try container.decode(String.self, forKey: .category_eid)
        self.v = try container.decode(Int.self, forKey: .v)
        self.photo = try container.decode(String.self, forKey: .photo)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.updated_at = try container.decode(Date.self, forKey: .updated_at)
        self.created_at = try container.decode(Date.self, forKey: .created_at)
        self.locations = try container.decodeIfPresent([Addresses].self, forKey: .addresses)
        self.contactInfo = try container.decode([ContactInfo].self, forKey: .contactInfo)
        self.socialMedia = try container.decodeIfPresent([SocialMedia].self, forKey: .socialMedia)
    }
}
