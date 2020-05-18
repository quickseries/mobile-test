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
    let updatedAt, createdAt: String
    let addresses: [Address]?
    let contactInfo: ContactInfo
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
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case addresses, contactInfo, bizHours, socialMedia
    }
}

typealias Restaurants = [Restaurant]
