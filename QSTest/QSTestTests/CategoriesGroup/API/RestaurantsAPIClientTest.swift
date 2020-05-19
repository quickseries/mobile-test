//
//  RestaurantsAPIClientTest.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import XCTest
@testable import QSTest

class RestaurantsAPIClientTest: XCTestCase {
    var networkSession: URLSessionMock!
    var sut: RestaurantsAPIClient?
    var models: Restaurants?
    var error: NSError?
    
    override func setUp() {
        super.setUp()
        networkSession = URLSessionMock.mockedSession(with: "restaurants", error: nil)
        guard let baseURL = URL(string: Constants.API.baseURL) else { return }
        sut = RestaurantsAPIClient(baseUrl: baseURL, validateStatusCode: false, sessionManager: networkSession)
    }
    
    private func makeGetRestaurantsCall() {
        sut?.getRestaurants(success: { (models) in
            self.models = models
        }, failure: { (error) in
            self.error = error
        })
    }
    
    func testGetRestaurantsSuccess() {
        networkSession.error = nil
        makeGetRestaurantsCall()
        XCTAssertNil(error)
        XCTAssertEqual(models?.count, 4)
    }
}
