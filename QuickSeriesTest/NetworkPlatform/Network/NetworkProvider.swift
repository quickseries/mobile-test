//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Domain
import Alamofire

final class NetworkProvider {
  private let apiEndpoint: String
  
  public init() {
    apiEndpoint = Constants.EndPoints.baseApiUrl.rawValue
  }
  public func makeGetCategoriesNetwork() -> GetCategoriesNetwork {
    let network = Network<CategoryNetworkModel.Response>(Constants.EndPoints.baseApiUrl.rawValue)
    return GetCategoriesNetwork(network: network)
  }
}
