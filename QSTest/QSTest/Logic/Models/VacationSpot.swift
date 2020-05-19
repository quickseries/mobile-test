//
//  VacationSpot.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

// MARK: - VacationSpotElement
struct VacationSpot: Codable {
    let id, slug, eid: String
    let photo: String
    let title, vacationSpotDescription, categoryEid: String
    let v: Int
    let active: Bool
    let updated, created: Date
    let socialMedia: SocialMedia
    let addresses: [Address]?
    let contactInfo: ContactInfo

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug, eid, photo, title
        case vacationSpotDescription = "description"
        case categoryEid = "category_eid"
        case v = "__v"
        case active = "_active"
        case updated = "updated_at"
        case created = "created_at"
        case socialMedia, addresses, contactInfo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.eid = try container.decode(String.self, forKey: .eid)
        self.photo = try container.decode(String.self, forKey: .photo)
        self.title = try container.decode(String.self, forKey: .title)
        self.vacationSpotDescription = try container.decode(String.self, forKey: .vacationSpotDescription)
        self.categoryEid = try container.decode(String.self, forKey: .categoryEid)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.v = try container.decode(Int.self, forKey: .v)
        self.created = try container.decode(Date.self, forKey: .created)
        self.updated = try container.decode(Date.self, forKey: .updated)
        self.socialMedia = try container.decode(SocialMedia.self, forKey: .socialMedia)
        self.addresses = try container.decodeIfPresent([Address].self, forKey: .addresses)
        self.contactInfo = try container.decode(ContactInfo.self, forKey: .contactInfo)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.slug, forKey: .slug)
        try container.encode(self.eid, forKey: .eid)
        try container.encode(self.photo, forKey: .photo)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.vacationSpotDescription, forKey: .vacationSpotDescription)
        try container.encode(self.categoryEid, forKey: .categoryEid)
        try container.encode(self.active, forKey: .active)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.created, forKey: .created)
        try container.encode(self.updated, forKey: .updated)
        try container.encode(self.socialMedia, forKey: .socialMedia)
        try container.encodeIfPresent(self.addresses, forKey: .addresses)
        try container.encode(self.contactInfo, forKey: .contactInfo)
    }
    
    init(id: String, slug: String, eid: String, photo: String, title: String, vacationSpotDescription: String, categoryEid: String, active: Bool, v: Int, created: Date, updated: Date, socialMedia: SocialMedia, addresses: [Address], contactInfo: ContactInfo) {
        self.id = id
        self.slug = slug
        self.eid = eid
        self.photo = photo
        self.title = title
        self.vacationSpotDescription = vacationSpotDescription
        self.categoryEid = categoryEid
        self.active = active
        self.v = v
        self.updated = updated
        self.created = created
        self.socialMedia = socialMedia
        self.addresses = addresses
        self.contactInfo = contactInfo
    }
}

typealias VacationSpots = [VacationSpot]
