//
//  VacationSpotsAPIClientTest.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import XCTest
@testable import QSTest

class VacationSpotsAPIClientTest: XCTestCase {
    var networkSession: URLSessionMock!
    var sut: VacationSpotsAPIClient?
    var models: VacationSpots?
    var error: NSError?
    
    override func setUp() {
        super.setUp()
        networkSession = URLSessionMock.mockedSession(with: "vacation-spot", error: nil)
        guard let baseURL = URL(string: Constants.API.baseURL) else { return }
        
        sut = VacationSpotsAPIClient(baseUrl: baseURL,
                                     validateStatusCode: false,
                                     sessionManager: networkSession)
    }
    
    private func makeGetVacationSpotsCall() {
        sut?.getVacationSpots(success: { (models) in
            self.models = models
        }, failure: { (error) in
            self.error = error
        })
    }
    
    func testGetRestaurantsSuccess() {
        networkSession.error = nil
        makeGetVacationSpotsCall()
        
        XCTAssertNil(error)
        XCTAssertEqual(models?.count, 1)
    }
    
    func testGetRestaurantFailure() {
        let error = NSError(domain: Constants.Error.apiDomain,
                            code: Constants.Error.defaultErrorCode,
                            userInfo: nil)
        
        networkSession.error = error
        networkSession.data = nil
        makeGetVacationSpotsCall()
        
        XCTAssertNil(models)
        XCTAssertNotNil(error)
    }
}
