//
//  ResourceInteractorTestCases.swift
//  QuickSeriesPublishingTests
//
//  Created by Tony Tran on 2020-05-22.
//  Copyright © 2020 quickseries. All rights reserved.
//

import XCTest
@testable import QuickSeriesPublishing

class ResourceInteractorTestCases1: XCTestCase {
    var sut: ResourceInteractorMock1!
    var viewModel: ResourceViewModel!

    override func setUp() {
        sut = ResourceInteractorMock1()
        viewModel = ResourceViewModel(categoryId: "", interactor: sut) 
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResourceModel() {
        viewModel.fetch { resource in
            XCTAssert(resource.count == 1)
            XCTAssertNotNil(resource.first!.contactInfo)
            XCTAssert(resource.first!.contactInfo!.details.first!["WEBSITE"]!.count == 1)
            XCTAssert(resource.first!.contactInfo!.details[1]["EMAIL ADDRESS"]!.count == 1)
            XCTAssert(resource.first!.contactInfo!.details.last!["PHONE NUMBER"]!.count == 2)
            XCTAssert(resource.first!.addresses!.count == 1)
        }
    }
}

