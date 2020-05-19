//
//  RestaurantsAPIProtocolMock.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class RestaurantsAPIProtocolMock: RestaurantsAPIClientProtocol {
    var models: Restaurants?
    var error: NSError?
    
    private(set) var getRestaurantsEventReceived = false
    
    func getRestaurants(success: APIRestaurantsSuccessCallback?, failure: APIFailureCallback?) {
        getRestaurantsEventReceived = true
        
        if let mockedModels = models {
            success?(mockedModels)
        } else if let error = error {
            failure?(error)
        }
    }
}
