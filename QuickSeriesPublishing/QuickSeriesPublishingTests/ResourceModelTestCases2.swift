//
//  ResourceInteractorTestCases.swift
//  QuickSeriesPublishingTests
//
//  Created by Tony Tran on 2020-05-22.
//  Copyright © 2020 quickseries. All rights reserved.
//

import XCTest
@testable import QuickSeriesPublishing

class ResourceInteractorTestCases2: XCTestCase {
    var sut: ResourceInteractorMock2!
    var viewModel: ResourceViewModel!

    override func setUp() {
        sut = ResourceInteractorMock2()
        viewModel = ResourceViewModel(categoryId: "", interactor: sut) 
    }

    func testResourceModel() {
        viewModel.fetch { resource in
            XCTAssert(resource.count == 3)
            XCTAssertNotNil(resource[1].socialMedia)
            XCTAssertNotNil(resource[1].socialMedia!.youtubeChannel!.count == 3)
        }
    }
}

