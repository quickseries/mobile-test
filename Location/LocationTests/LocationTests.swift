//
//  LocationTests.swift
//  LocationTests
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import XCTest
@testable import Location
@testable import Moya


class LocationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategories() {
        DataManager().getCategories(completionHandler: {(categories, error) in
            XCTAssertNotNil(categories)
            XCTAssertNil(error)
        })
    }
    
    func testResturent()  {
        DataManager().getLocation(target:APIService.restaurants , completionHandler: {(locations, error) in
            XCTAssertNotNil(locations)
            XCTAssertNil(error)
        })
    }
    
    func testVactionSpot() {
        DataManager().getLocation(target:APIService.vacationSpot , completionHandler: {(vactionSpot, error) in
            XCTAssertNotNil(vactionSpot)
            XCTAssertNil(error)
        })
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
