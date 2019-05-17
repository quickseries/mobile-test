//
//  GetCategoriesNetwork.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Domain
import RxSwift

public final class GetCategoriesNetwork {
  
  private let network: Network<CategoryNetworkModel.Response>
  
  init(network: Network<CategoryNetworkModel.Response>) {
    self.network = network
  }
  
  public func getCategories(requestParameter: CategoryNetworkModel.Request) -> Observable<[CategoryNetworkModel.Response]> {
    return network.getItems(Constants.EndPoints.categories.rawValue)
  }
}
