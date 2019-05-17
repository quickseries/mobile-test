//
//  ResourcesUsecase.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation
import PromiseKit

public enum ResourcesType: String {
  case vacationSpot = "vacation-spot"
  case restaurants = "restaurants"
  
  static func getResourceType(forCategory category: String) -> ResourcesType {
    switch category.lowercased() {
    case "Restaurants".lowercased():
      return ResourcesType.restaurants
    case "Vacation Spots".lowercased():
      return ResourcesType.vacationSpot
    default:
      return ResourcesType.restaurants
    }
  }
}

public struct ResourcesUsecase: ResourcesUsecaseProtocol {
  let resourceService: ServiceType
  
  init(service: ServiceType) {
    self.resourceService = service
  }
  
  public func getResources(ofType type: ResourcesType) -> Promise<[ResoucesResponse]> {
    return type.rawValue
           |> self.resourceService.fetchResourceDetails(forCategory:)
  }
}

public protocol ResourcesUsecaseProtocol {
  func getResources(ofType type: ResourcesType) -> Promise<[ResoucesResponse]>
}
