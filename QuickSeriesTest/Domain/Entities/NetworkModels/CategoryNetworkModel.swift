//
//  ResourceCategoryNetworkModel.swift
//  Domain
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

public enum CategoryNetworkModel: InteractiveModelType {
  public struct Request: Codable {
    public let languageId: Int
    
    public init(languageId: Int) {
      self.languageId = languageId
    }
  }
  
  public struct Response: Codable {
    public let id: String
    public let updatedAt: String
    public let slug: String
    public let customModuleId: String
    public let eid: String
    public let title: String
    public let description: String?
    public let version: Int
    public let isActive: Bool
    public let createdAt: String

    private enum CodingKeys : String, CodingKey {
      case id = "_id", updatedAt = "updated_at", slug , customModuleId = "custom_module_eid", eid, title, description, version = "__v", isActive = "_active", createdAt = "created_at"
    }
  }
  
  public enum SlugType: String {
    case restaurant = "Restaurants"
    case vacationSpot = "vacation-spots"
  }
}
