//
//  GetRestaurantsNetwork.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Domain
import RxSwift

public final class GetRestaurantsNetwork {
  
  private let network: Network<RestaurantNetworkModel.Response>
  
  init(network: Network<RestaurantNetworkModel.Response>) {
    self.network = network
  }
  
  public func getRestaurants(requestParameter: RestaurantNetworkModel.Request) -> Observable<[RestaurantNetworkModel.Response]> {
    return network.getItems(Constants.EndPoints.restaurants.rawValue)
  }
}
