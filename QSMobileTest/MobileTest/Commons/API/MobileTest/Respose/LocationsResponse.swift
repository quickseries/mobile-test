//
//  RestaurantsResponse.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import Foundation

// MARK: - LocationJSONElement
struct LocationJSONElement: Codable {
    let id, slug, eid, title: String
    let fullDescription, categoryEid: String
    let v: Int
    let photo: String
    let active: Bool
    let updatedAt, createdAt: String
    let addresses: [Address]?
    let freeText: FreeText?
    let contactInfo: ContactInfo
    let bizHours: BizHours?
    let socialMedia: SocialMedia?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug, eid, title
        case fullDescription = "description"
        case categoryEid = "category_eid"
        case v = "__v"
        case photo
        case active = "_active"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case addresses, freeText, contactInfo, bizHours, socialMedia
    }
}

struct VacationSpotJSONElement: Codable {
    let id, slug, eid: String
    let photo: String
    let title, fullDescription, categoryEid: String
    let v: Int
    let active: Bool
    let updatedAt, createdAt: String
    let socialMedia: SocialMedia
    let addresses, freeText: [Address]
    let contactInfo: ContactInfo

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug, eid, photo, title
        case fullDescription = "description"
        case categoryEid = "category_eid"
        case v = "__v"
        case active = "_active"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case socialMedia, addresses, freeText, contactInfo
    }
}

// MARK: - Address
struct Address: Codable {
    let address1, label, zipCode, city: String
    let state, country: String
    let gps: Gps?
}

// MARK: - Gps
struct Gps: Codable {
    let latitude, longitude: String
}

// MARK: - BizHours
struct BizHours: Codable {
    let sunday, monday: Nday
}

// MARK: - Nday
struct Nday: Codable {
    let from, to: String
}

// MARK: - ContactInfo
struct ContactInfo: Codable {
    let website: [String]?
    let email: [String]?
    let phoneNumber: [String]
    let faxNumber, tollFree: [String]?
}

// MARK: - SocialMedia
struct SocialMedia: Codable {
    let youtubeChannel, twitter, facebook: [String]
}

struct FreeText: Codable {
    let phoneNumber: String?
}

typealias RestaurantsResponse = [LocationJSONElement]

typealias VacationSpotsResponse = [VacationSpotJSONElement]
