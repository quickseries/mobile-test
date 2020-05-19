//
//  VacationSpotAPIProtocolMock.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class VacationSpotAPIProtocolMock: VacationSpotsAPIClientProtocol {
    var models: VacationSpots?
    var error: NSError?
    
    private(set) var getVacationSpotsEventReceived = false
    
    func getVacationSpots(success: APIVacationSpotsSuccessCallback?, failure: APIFailureCallback?) {
        getVacationSpotsEventReceived = true
        
        if let mockedModels = models {
            success?(mockedModels)
        } else if let error = error {
            failure?(error)
        }
    }
}
