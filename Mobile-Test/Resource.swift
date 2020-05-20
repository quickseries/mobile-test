//
//  Location.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation

struct Resource: Codable {
    let id: String
    let title: String
    let description: String?
    let slug: String
    let isActive: Bool
    let photoURL: URL
    let bizHours: [String: [String: String]]?
    let addresses: [Address]?
    let socialMedia: SocialMediaInfo?
    let contactInfo: ContactInfo
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case description
        case slug
        case isActive = "_active"
        case photoURL = "photo"
        case bizHours
        case addresses
        case socialMedia
        case contactInfo
    }
}
