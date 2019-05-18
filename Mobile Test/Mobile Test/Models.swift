//
//  Models.swift
//  Mobile Test
//
//  Created by Alecu Truica on 5/18/19.
//  Copyright © 2019 Alecu Truica. All rights reserved.
//

import Foundation

struct Category: Codable {
    let id: String
    let updatedAt: String
    let slug: String
    let customModuleEid: String
    let eid: String
    let title: String
    let description: String?
    let _v: Int
    let active: Bool
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case updatedAt = "updated_at"
        case slug
        case customModuleEid = "custom_module_eid"
        case eid
        case title
        case description
        case _v = "__v"
        case active = "_active"
        case createdAt = "created_at"
    }
}

struct Resource: Codable {
    let id: String
    let slug: String
    let eid: String
    let title: String
    var description: String
    let bizHours: BusinessHours?
    let categoryEid: String
    let _v: Int
    let photoURL: String
    let active: Bool
    let updatedAt: String
    let createdAt: String
    let addresses: [Address]?
    let contactInfo: ContactInfo?
    let socialMedia: SocialMedia?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug, eid, title, description, addresses, contactInfo, socialMedia, bizHours
        case categoryEid = "category_eid"
        case _v = "__v"
        case active = "_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case photoURL = "photo"
    }
    
    struct BusinessHours: Codable {
        let days: Hours?
        
        struct Hours: Codable {
            let sunday: Day?
            let monday: Day?
            let tuesday: Day?
            let wednesday: Day?
            let thursday: Day?
            let friday: Day?
            let saturday: Day?
            
            struct Day: Codable {
                let from: String?
                let to: String?
            }
        }
    }
    
    struct Address: Codable {
        let address1: String?
        let label: String?
        let zipCode: String?
        let city: String?
        let state: String?
        let country: String?
        let gps: Coordinates?
        
        struct Coordinates: Codable {
            let latitude: String
            let longitude: String
        }
    }
    
    struct ContactInfo: Codable {
        let website: [String]?
        let email: [String]?
        let phoneNumber: [String]?
        let faxNumber: [String]?
        let tollFree: [String]?
    }
    
    struct SocialMedia: Codable {
        let youtubeChannel: [String]?
        let twitter: [String]?
        let facebook: [String]?
    }
}
