//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
  private let networkProvider: NetworkProvider
  
  public init() {
    networkProvider = NetworkProvider()
  }
  
  public func makeGetCategoriesUseCase() -> Domain.GetCategoriesUseCase {
    return GetResourceCategoriesUseCase(network: networkProvider.makeGetCategoriesNetwork())
  }
  public func makeGetRestaurantsUseCase() -> Domain.GetRestaurantsUseCase {
    return GetRestaurantsUseCase(network: networkProvider.makeGetRestaurantsNetwork())
  }
  public func makeGetVacationSpotsUseCase() -> Domain.GetVacationSpotsUseCase {
    return GetVacationSpotsUseCase(network: networkProvider.makeGetVacationSpotsNetwork())
  }
}
