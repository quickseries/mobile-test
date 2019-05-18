//
//  CategoryResource.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public class CategoryResource: Resource, Codable {
    
    public let id: String
    public let title: String
    public let photo: String
    public let addresses: [Address]?
    public let contactInfo: ContactInfo?
    public let socialMedia: SocialMedia?
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
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: CodingKeys.id)
        title = try container.decode(String.self, forKey: CodingKeys.title)
        photo = try container.decode(String.self, forKey: CodingKeys.photo)
        
        // This is here to handle a special case present in the JSON where an address object is passed without any keys.
        do {
            addresses = try container.decodeIfPresent([Address].self, forKey: CodingKeys.addresses)
        } catch {
            addresses = nil
        }
        
        contactInfo = try container.decodeIfPresent(ContactInfo.self, forKey: CodingKeys.contactInfo)
        socialMedia = try container.decodeIfPresent(SocialMedia.self, forKey: CodingKeys.socialMedia)
        description = try container.decode(String.self, forKey: CodingKeys.description)
    }
}
