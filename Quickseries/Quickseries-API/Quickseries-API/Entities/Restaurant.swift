//
//  Restaurant.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

struct Restaurant: CategoryResource, Codable  {
    
    let id: Int
    let title: String
    let photo: String
    let addresses: [Address]
    let contactInfo: ContactInfo
    let socialMedia: SocialMedia
    let description: String
    let businessHours: BusinessHours?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title = "title"
        case photo = "photo"
        case addresses = "addresses"
        case contactInfo = "contactInfo"
        case socialMedia = "socialMedia"
        case description = "description"
        case businessHours = "businessHours"
    }
}
