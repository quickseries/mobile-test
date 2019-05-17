//
//  GetVacationSpotsNetwork.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Domain
import RxSwift

public final class GetVacationSpotsNetwork {
  
  private let network: Network<VacationSpotNetworkModel.Response>
  
  init(network: Network<VacationSpotNetworkModel.Response>) {
    self.network = network
  }
  
  public func getRestaurants(requestParameter: VacationSpotNetworkModel.Request) -> Observable<[VacationSpotNetworkModel.Response]> {
    return network.getItems(Constants.EndPoints.vacationSpots.rawValue)
  }
}
