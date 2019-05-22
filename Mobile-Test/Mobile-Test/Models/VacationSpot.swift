//
//  VacationSpot.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Foundation

struct VacationSpot: Codable {
    var id: String
    var photo: URL? // https://s3.amazonaws.com/qsapi-files/files/49851e71-5114-4d94-9d9a-7f3cacb1764e/0f625c2f-7e01-4dd9-b569-f96c1c7b35f6.jpeg
    var socialMedia: SocialMedia
    var contactInfo: ContactInfo
    var title: String
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case description, photo, socialMedia, contactInfo, title
    }
    
    public init(from decoder: Decoder) throws {
        let allValues = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try allValues.decode(String.self, forKey: .id)
        self.photo = try URL(string: allValues.decodeIfPresent(String.self, forKey: .photo) ?? "")
        self.socialMedia = try allValues.decode(SocialMedia.self, forKey: .socialMedia)
        self.contactInfo = try allValues.decode(ContactInfo.self, forKey: .contactInfo)
        self.title = try allValues.decode(String.self, forKey: .title)
        self.description = try allValues.decodeIfPresent(String.self, forKey: .description)?.html2String
    }
}

struct SocialMedia: Codable {
    var youtubeChannel: [String]
    var twitter: [String]
    var facebook: [String]
}

struct ContactInfo: Codable {
    var website: [String]
    var email: [String]
    var faxNumber: [String]
    var phoneNumber: [String]
    var tollFree: [String]
}
