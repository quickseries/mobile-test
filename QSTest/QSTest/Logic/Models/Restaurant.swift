//
//  Restaurant.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

// MARK: - Restaurant
struct Restaurant: Codable {
    let id, slug, eid, title: String
    let restaurantDescription, categoryEid: String
    let v: Int
    let photo: String
    let active: Bool
    let updated, created: Date
    let addresses: [Address]?
    let contactInfo: ContactInfo?
    let bizHours: BizHours?
    let socialMedia: SocialMedia?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug, eid, title
        case restaurantDescription = "description"
        case categoryEid = "category_eid"
        case v = "__v"
        case photo
        case active = "_active"
        case updated = "updated_at"
        case created = "created_at"
        case addresses, contactInfo, bizHours, socialMedia
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.eid = try container.decode(String.self, forKey: .eid)
        self.title = try container.decode(String.self, forKey: .title)
        self.restaurantDescription = try container.decode(String.self, forKey: .restaurantDescription)
        self.categoryEid = try container.decode(String.self, forKey: .categoryEid)
        self.v = try container.decode(Int.self, forKey: .v)
        self.photo = try container.decode(String.self, forKey: .photo)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.updated = try container.decode(Date.self, forKey: .updated)
        self.created = try container.decode(Date.self, forKey: .created)
        self.addresses = try container.decodeIfPresent([Address].self, forKey: .addresses)
        self.contactInfo = try container.decodeIfPresent(ContactInfo.self, forKey: .contactInfo)
        self.bizHours = try container.decodeIfPresent(BizHours.self, forKey: .bizHours)
        self.socialMedia = try container.decodeIfPresent(SocialMedia.self, forKey: .socialMedia)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.slug, forKey: .slug)
        try container.encode(self.eid, forKey: .eid)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.restaurantDescription, forKey: .restaurantDescription)
        try container.encode(self.categoryEid, forKey: .categoryEid)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.photo, forKey: .photo)
        try container.encode(self.active, forKey: .active)
        try container.encode(self.updated, forKey: .updated)
        try container.encode(self.created, forKey: .created)
        try container.encode(self.addresses, forKey: .addresses)
        try container.encode(self.contactInfo, forKey: .contactInfo)
        try container.encode(self.bizHours, forKey: .bizHours)
        try container.encode(self.socialMedia, forKey: .socialMedia)
    }
    
    init(id: String, slug: String, eid: String, title: String, restaurantDescription: String, categoryEid: String, v: Int, photo: String, active: Bool, updated: Date, created: Date, addresses: [Address]?, contactInfo: ContactInfo, bizHours: BizHours?, socialMedia: SocialMedia?) {
        self.id = id
        self.slug = slug
        self.eid = eid
        self.title = title
        self.restaurantDescription = restaurantDescription
        self.categoryEid = categoryEid
        self.v = v
        self.photo = photo
        self.active = active
        self.updated = updated
        self.created = created
        self.addresses = addresses
        self.contactInfo = contactInfo
        self.bizHours = bizHours
        self.socialMedia = socialMedia
    }
}

typealias Restaurants = [Restaurant]
