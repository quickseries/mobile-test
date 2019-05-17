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
  
  public func makeGetResourceCategoriesUseCase() -> Domain.GetCategoriesUseCase {
    return GetResourceCategoriesUseCase(network: networkProvider.makeGetCategoriesNetwork())
  }
  
}
