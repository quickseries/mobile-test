//
//  Categories.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation

public struct CategoryResponse: Codable {
  public let id: String
  public let updatedAt: Date
  public let slug: String
  public let customModuleEid: String
  public let eid: String
  public let title: String
  public let description: String?
  public let v: Int
  public let active: Bool
  public let createdAt: Date
  private enum CodingKeys: String, CodingKey {
    case id = "_id"
    case updatedAt = "updated_at"
    case slug
    case customModuleEid = "custom_module_eid"
    case eid
    case title
    case description
    case v = "__v"
    case active = "_active"
    case createdAt = "created_at"
  }
}
