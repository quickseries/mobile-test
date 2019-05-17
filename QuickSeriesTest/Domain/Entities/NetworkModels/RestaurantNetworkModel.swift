//
//  RestaurantNetworkModel.swift
//  Domain
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

public enum RestaurantNetworkModel: InteractiveModelType {
  public struct Request: Codable {
    public let languageId: Int
    
    public init(languageId: Int) {
      self.languageId = languageId
    }
  }
  
  public struct Response: Codable {
    public let id: String
    public let slug: String
    public let eid: String
    public let title: String
    public let description: String?
    public let businessHours: BusinessWeek?
    public let categoryId: String
    public let version: Int
    public let photo: String
    public let isActive: Bool
    public let updatedAt: String
    public let createdAt: String
    public let addresses: [Adress]?
    public let contactInfo: ContactInfo
    public let socialMedia: SocialMedia?

    private enum CodingKeys : String, CodingKey {
      case id = "_id", slug, eid, title, description, businessHours = "bizHours", categoryId = "category_eid", version = "__v", photo, isActive = "_active", updatedAt = "updated_at", createdAt = "created_at", addresses, contactInfo, socialMedia
    }
  }
}
