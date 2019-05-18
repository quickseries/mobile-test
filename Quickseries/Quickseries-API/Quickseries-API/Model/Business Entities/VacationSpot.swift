//
//  VacationSpot.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct VacationSpot: CategoryResource, Codable  {
    
    public let id: Int
    public let title: String
    public let photo: String
    public let addresses: [Address]
    public let contactInfo: ContactInfo
    public let socialMedia: SocialMedia
    public let description: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title = "title"
        case photo = "photo"
        case addresses = "addresses"
        case contactInfo = "contactInfo"
        case socialMedia = "socialMedia"
        case description = "description"
    }
}
