//
//  RestaurantsAPIClient.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

typealias APIRestaurantsSuccessCallback = (_ categories: Restaurants) -> Void

protocol RestaurantsAPIClientProtocol {
    func getRestaurants(success: APIRestaurantsSuccessCallback?, failure: APIFailureCallback?)
}

class RestaurantsAPIClient: APIHelper, RestaurantsAPIClientProtocol {
    func getRestaurants(success: APIRestaurantsSuccessCallback?, failure: APIFailureCallback?) {
        self.get(path: standardPath(with: Constants.API.restaurantsPath),
                 params: nil,
                 successArray: { (response) in
                    let model: Restaurants = try decodeJSONOrThrow(response)
                    success?(model)
        },
                 failure: failure)
    }
}
