//
//  Restaurant.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-15.
//  Copyright © 2020 Israel Romero. All rights reserved.
//

import Foundation

struct Location: Codable {
    let id: String
    let title: String
    let description: String?
    let slug: String
    let isActive: Bool
    let photoURL: URL
    let addresses: [Address]
    let socialMedia: SocialMediaInfo?
    let contactInfo: ContactInfo
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case description
        case slug
        case isActive = "_active"
        case photoURL = "photo"
        case addresses
        case socialMedia
        case contactInfo
    }
}
