//
//  GetVacationSpotsUseCase.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import RxSwift
import Domain

public final class GetVacationSpotsUseCase: Domain.GetVacationSpotsUseCase {
  private let network: GetVacationSpotsNetwork
  
  init(network: GetVacationSpotsNetwork) {
    self.network = network
  }
  public func getVacationSpots(requestParameter: VacationSpotNetworkModel.Request) -> Observable<[VacationSpotNetworkModel.Response]> {
    return network.getRestaurants(requestParameter: requestParameter)
  }
}
