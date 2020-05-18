//
//  Resources.swift
//  QuickSeries
//
//  Created by Parth Patel on 14/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation

struct Addresses: Codable {
    var address   : String?
    var city      : String?
    var state     : String?
    var zipCode   : String?
    var country   : String?
    var label     : String?
    var gps       : GPS?
    
    private enum CodingKeys : String, CodingKey {
        case address     = "address1"
        case city, state, zipCode, country, label, gps
    }
}

struct GPS: Codable {
    var latitude   : String?
    var longitude  : String?
}

struct BizHours: Codable {
    var sunday   : WorkingTime?
    var monday  : WorkingTime?
    var tuesday  : WorkingTime?
    var wednesday  : WorkingTime?
    var thursday  : WorkingTime?
    var friday  : WorkingTime?
    var saturday  : WorkingTime?
}


struct WorkingTime: Codable {
    var from   : String?
    var to  : String?
}

struct SocialMedia: Codable {
    var facebook : [String]?
    var twitter : [String]?
    var youtube : [String]?
    
    private enum CodingKeys : String, CodingKey {
        case youtube     = "youtubeChannel"
        case facebook, twitter
    }
}

struct SocialMediaDetails {    
    var facebook: (String, String?) = ("FaceBook", nil)
    var twitter : (String, String?) = ("Twitter", nil)
    var youtube : (String, String?) = ("YouTube", nil)
    
    init(info: SocialMedia) {
        self.facebook.1 = info.facebook?.first
        self.twitter.1 = info.twitter?.first
        self.youtube.1 = info.youtube?.first
    }

}

struct ContactInfo: Codable {
    var phoneNumber : [String]?
    var tollFree : [String]?
    var faxNumber : [String]?
    var email : [String]?
    var website : [String]?
}

struct ContactDetails {
    var phoneNumber: (String, String?) = (ContactStrings.phoneNumberText.rawValue, nil)
    var tollFree : (String, String?) = (ContactStrings.tollFreeNumberText.rawValue, nil)
    var faxNumber : (String, String?) = (ContactStrings.faxNumberText.rawValue, nil)
    var email : (String, String?) = (ContactStrings.emailText.rawValue, nil)
    var website : (String, String?) = (ContactStrings.websiteText.rawValue, nil)
    
    init(info: ContactInfo) {
        self.phoneNumber.1 = info.phoneNumber?.first
        self.tollFree.1 = info.tollFree?.first
        self.faxNumber.1 = info.faxNumber?.first
        self.email.1 = info.email?.first
        self.website.1 = info.website?.first
    }
}

struct Resources: Codable {
    let id: String?
    let slug: String?
    let eId: String?
    let title: String
    let description: String?
    let categoryEid: String?
    let v: Int?
    let photo: String?
    let active: Bool?
    let updatedAt: String?
    let createdAt: String?
    var addresses: [Addresses]?
    var contactInfo: ContactInfo?
    var bizHours: BizHours?
    var socialMedia: SocialMedia?
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug
        case eId = "eid"
        case title, description
        case categoryEid = "category_eid"
        case v = "__v"
        case photo
        case active = "_active"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case addresses, contactInfo, bizHours, socialMedia
    }
    
}
