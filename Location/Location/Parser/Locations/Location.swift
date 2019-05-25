//
//  Location.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation

struct Location : Codable {
    let _id : String?
    let slug : String?
    let eid : String?
    let photo : String?
    let title : String?
    let description : String?
    let category_eid : String?
    let __v : Int?
    let _active : Bool?
    let updated_at : String?
    let created_at : String?
    let socialMedia : SocialMedia?
    let addresses : [Addresses]?
    let freeText : [FreeText]?
    let contactInfo : ContactInfo?
    let gps : Gps?
    
    enum CodingKeys: String, CodingKey {
        
        case _id = "_id"
        case slug = "slug"
        case eid = "eid"
        case photo = "photo"
        case title = "title"
        case description = "description"
        case category_eid = "category_eid"
        case __v = "__v"
        case _active = "_active"
        case updated_at = "updated_at"
        case created_at = "created_at"
        case socialMedia = "socialMedia"
        case addresses = "addresses"
        case freeText = "freeText"
        case contactInfo = "contactInfo"
        case gps = "gps"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        eid = try values.decodeIfPresent(String.self, forKey: .eid)
        photo = try values.decodeIfPresent(String.self, forKey: .photo)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        category_eid = try values.decodeIfPresent(String.self, forKey: .category_eid)
        __v = try values.decodeIfPresent(Int.self, forKey: .__v)
        _active = try values.decodeIfPresent(Bool.self, forKey: ._active)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        socialMedia = try values.decodeIfPresent(SocialMedia.self, forKey: .socialMedia)
        addresses = try values.decodeIfPresent([Addresses].self, forKey: .addresses)
        freeText = try values.decodeIfPresent([FreeText].self, forKey: .freeText)
        contactInfo = try values.decodeIfPresent(ContactInfo.self, forKey: .contactInfo)
        gps = try values.decodeIfPresent(Gps.self, forKey: .gps)
    }
    
}
