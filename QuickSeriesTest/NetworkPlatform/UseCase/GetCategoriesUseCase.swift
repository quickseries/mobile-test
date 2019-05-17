//
//  GetCategoriesUseCase.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import RxSwift
import Domain

public final class GetResourceCategoriesUseCase: Domain.GetCategoriesUseCase {
  private let network: GetCategoriesNetwork
  
  init(network: GetCategoriesNetwork) {
    self.network = network
  }
  
  public func getCategories(requestParameter: CategoryNetworkModel.Request) -> Observable<[CategoryNetworkModel.Response]> {
    return network.getCategories(requestParameter: requestParameter)
  }
}
