//
//  Route.swift
//  mobileTest
//
//  Created by Balraj Singh on 13/04/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation
import Alamofire

/**
 A list of possible requests that can be made for mobileTest data.
 */
internal enum Route {
  case getCategoryRequest()
  case getResources(String)
  
  internal var requestProperties:
    (method: HTTPMethod, path: String, query: [String: Any]) {
    switch self {
    case .getCategoryRequest():
      return (HTTPMethod.get, "/mobile-test/master/data/categories.json", [String: Any]())
    case .getResources(let category):
      return (HTTPMethod.get, "/mobile-test/master/data/\(category).json", [String: Any]())
    }
  }
}
