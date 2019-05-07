//
//  Restaurant.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/25/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import Foundation
import UIKit

struct Resource: Codable {
    var id: String
    var slug: String
    var eid: String
    var title: String
    var description: String
    var categoryEid: String
    var v: Int
    var photo: String
    var active: Bool
    var updatedAt: String
    var createdAt: String
    var addresses: [Address]?
    var freeText: [Address]?
    var contactInfo: ContactInfo
    var bizHours: BizHours?
    var socialMedia: SocialMedia?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug, eid, title, description
        case categoryEid = "category_eid"
        case v = "__v"
        case photo
        case active = "_active"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case addresses, contactInfo, bizHours, socialMedia, freeText
    }
}




struct Address: Codable {
    let address1: String?
    var label: String?
    var zipCode: String?
    var city: String?
    let state: String?
    var country: String?
    let gps: Gps?
}

struct Gps: Codable {
    var latitude: String
    var longitude: String
}

struct BizHours: Codable {
    var sunday: Nday?
    var monday: Nday?
    var tuesday: Nday?
    var wednesday: Nday?
    var thursday: Nday?
    var friday: Nday?
    var saturday: Nday?
}

struct Nday: Codable {
    var from: String
    var to: String
}

struct ContactInfo: Codable {
    var website: [String]?
    var email: [String]?
    var faxNumber: [String]?
    var tollFree: [String]?
    var phoneNumber: [String]
}

struct SocialMedia: Codable {
    var youtubeChannel: [String]
    var twitter: [String]
    var facebook: [String]
}



extension Array where Element == Resource {
    func matching(_ text: String?) -> [Resource] {
        if let text = text, text.count > 0 {
            return self.filter {
                $0.title.contains(text)
                    || $0.description.contains(text)
            }
        } else {
            return self
        }
    }
    
}
