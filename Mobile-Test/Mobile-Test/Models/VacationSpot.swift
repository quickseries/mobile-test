//
//  VacationSpot.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

struct VacationSpot: Codable {
    var id: String
    var photo: String? // https://s3.amazonaws.com/qsapi-files/files/49851e71-5114-4d94-9d9a-7f3cacb1764e/0f625c2f-7e01-4dd9-b569-f96c1c7b35f6.jpeg
    var socialMedia: [SocialMedia]
    var contactInfo: [ContactInfo]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case photo, socialMedia, contactInfo
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
