//
//  Quickseries_APITests.swift
//  Quickseries-APITests
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import XCTest
@testable import Quickseries_API

class Quickseries_APITests: XCTestCase {

    var api: QuickseriesApi!
    
    override func setUp() {
        api = QuickseriesApiClient.shared
    }

    override func tearDown() {
        api = nil
    }

    func testExample() {
        let expectation = self.expectation(description: "Request Finished")
        var response: Outcome<[Quickseries_API.Category]>?
        api.getCategories() { outcome in
            response = outcome
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
        XCTAssertNotNil(response)
        switch response! {
        case .success(let results):
            XCTAssert(results.count == 2)
        case .failure:
            XCTAssert(false)
        }
    }
}
