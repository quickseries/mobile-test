//
//  UtiltsTests.swift
//  QuickSeriesTests
//
//  Created by Ramiz Rafiq on 4/28/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import XCTest
@testable import QuickSeries

class UtiltsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUtilImportFeature() {
        
        let jsonCategories = Utils.getDataForJson(filePath: "categories", extensionName: "json")
        let jsonResources = Utils.getDataForJson(filePath: "restaurants", extensionName: "json")

        XCTAssert(jsonCategories.success)
        XCTAssert(jsonResources.success)
        
    }
    func testUtilImportFail()
    {
        let jsonCategories = Utils.getDataForJson(filePath: "DummyCategories", extensionName: "json")
        let jsonResources = Utils.getDataForJson(filePath: "DummyResource", extensionName: "json")

        XCTAssertFalse(jsonCategories.success)
        XCTAssertFalse(jsonResources.success)
    }
}
