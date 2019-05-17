//
//  Service.swift
//  mobileTest
//
//  Created by Balraj Singh on 13/04/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation
import PromiseKit

public struct Service: ServiceType {
  public let serverConfig: ServerConfigType
  
  public init(serverConfig: ServerConfigType = ServerConfig.production) {
    self.serverConfig = serverConfig
  }
  
  public func fetchCatehoryDetails() -> Promise<[CategoryResponse]> {
    return fetch(forKey: FACache.categoryRespose)
      .recover { _ -> Promise<[CategoryResponse]> in
        return Route.getCategoryRequest()
               |> self.request(route:)
               |> self.decode(response:)
               |> self.cache(key: FACache.categoryRespose)
    }
  }
  
  public func fetchResourceDetails(forCategory category: String) -> Promise<[ResoucesResponse]> {
    return fetch(forKey: category)
      .recover { _ -> Promise<[ResoucesResponse]> in
        return Route.getResources(category)
               |> self.request(route:)
               |> self.decode(response:)
               |> self.cache(key: category)
    }
  }
}
