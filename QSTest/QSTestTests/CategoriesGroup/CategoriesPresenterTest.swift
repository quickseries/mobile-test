//
//  CategoriesPresenterTest.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import XCTest
@testable import QSTest

class CategoriesPresenterTest: XCTestCase {
    var sut: CategoriesPresenter?
    var delegate: CategoriesPresenterDelegateMock!
    var controller: CategoriesControllerMock!
    var api: CategoriesAPIProtocolMock!

    override func setUp() {
        super.setUp()
        delegate = CategoriesPresenterDelegateMock()
        api = CategoriesAPIProtocolMock()
        controller = CategoriesControllerMock()
        sut = CategoriesPresenter(controller: controller, delegate: delegate, api: api)
    }
    
    func testOnViewDidLoad() {
        api.models = [
            createCategory(),
            createCategory()
        ]
        sut?.onViewDidLoad()
        XCTAssertTrue(controller.showLoadingControllerEventReceived)
        XCTAssertTrue(controller.hideLoadingControllerEventReceived)
        XCTAssertTrue(controller.showCategoriesEventReceived)
        XCTAssertEqual(controller.rows?.count, 2)
        XCTAssertTrue(controller.setTitleEventReceived)
        XCTAssertEqual(controller.navBarTitle, "Categories")
    }
    
    func testDidSelect() {
        let model = createCategory()
        api.models = [
            model,
            createCategory()
        ]
        
        sut?.onViewDidLoad()
        sut?.onSelectCategory(categoryId: model.eid)
        XCTAssertTrue(delegate.didSelectCategory)
        XCTAssertEqual(delegate.category?.eid, model.eid)
    }
    
    func testErrorFromAPI() {
        let error = NSError(domain: Constants.Error.apiDomain,
                            code: Constants.Error.defaultErrorCode,
                            userInfo: nil)
        api.error = error
        
        sut?.onViewDidLoad()
        XCTAssertTrue(controller.showErrorEventReceived)
        XCTAssertEqual(controller.error?.domain, error.domain)
        XCTAssertEqual(controller.error?.code, error.code)
    }
    
}

private extension CategoriesPresenterTest {
    func createCategory() -> QSTest.Category {
        let title = Bool.random() == true ? "Restaurants" : "Vacation Spots"
        
        return QSTest.Category(id: UUID().uuidString,
                               slug: title,
                               customModuleEid: UUID().uuidString,
                               eid: UUID().uuidString,
                               title: title,
                               description: "\(title) description",
                               v: 0,
                               active: true,
                               created: Date(),
                               updated: Date())
    }
}
