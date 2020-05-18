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
    let updatedAt, createdAt: String
    let socialMedia: SocialMedia
    let addresses, freeText: [Address]
    let contactInfo: ContactInfo

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug, eid, photo, title
        case vacationSpotDescription = "description"
        case categoryEid = "category_eid"
        case v = "__v"
        case active = "_active"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case socialMedia, addresses, freeText, contactInfo
    }
}

typealias VacationSpots = [VacationSpot]
