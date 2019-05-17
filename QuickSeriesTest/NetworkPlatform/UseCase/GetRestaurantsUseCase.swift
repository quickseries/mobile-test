//
//  GetRestaurantsUseCase.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import RxSwift
import Domain

public final class GetRestaurantsUseCase: Domain.GetRestaurantsUseCase {
  private let network: GetRestaurantsNetwork
  
  init(network: GetRestaurantsNetwork) {
    self.network = network
  }
  public func getRestaurants(requestParameter: RestaurantNetworkModel.Request) -> Observable<[RestaurantNetworkModel.Response]> {
    return network.getRestaurants(requestParameter: requestParameter)
  }
}
