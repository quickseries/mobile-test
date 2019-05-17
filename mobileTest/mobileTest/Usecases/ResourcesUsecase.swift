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
}

public struct ResourcesUsecase {
  let resourceService: ServiceType
  
  init(service: ServiceType) {
    self.resourceService = service
  }
  
  public func getResources(ofType type: ResourcesType) -> Promise<[ResoucesResponse]> {
    return type.rawValue
           |> self.resourceService.fetchResourceDetails(forCategory:)
  }
}
