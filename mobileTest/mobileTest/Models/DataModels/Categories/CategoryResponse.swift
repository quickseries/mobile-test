//
//  Categories.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation

public struct CategoryResponse: Codable {
  public let title: String
  public let description: String?
  private enum CodingKeys: String, CodingKey {
    case title
    case description
  }
}
