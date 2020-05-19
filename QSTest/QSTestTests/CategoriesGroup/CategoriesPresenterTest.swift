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
    var categoriesAPI: CategoriesAPIProtocolMock!
    var restaurantsAPI: RestaurantsAPIProtocolMock!
    var vacationSpotAPI: VacationSpotAPIProtocolMock!

    override func setUp() {
        super.setUp()
        delegate = CategoriesPresenterDelegateMock()
        categoriesAPI = CategoriesAPIProtocolMock()
        restaurantsAPI = RestaurantsAPIProtocolMock()
        vacationSpotAPI = VacationSpotAPIProtocolMock()
        controller = CategoriesControllerMock()
        
        sut = CategoriesPresenter(controller: controller,
                                  delegate: delegate,
                                  categoriesAPI: categoriesAPI,
                                  restaurantsAPI: restaurantsAPI,
                                  vacationSpotsAPI: vacationSpotAPI)
    }
    
    func testOnViewDidLoad() {
        categoriesAPI.models = [
            Category.mocked(),
            Category.mocked()
        ]
        sut?.onViewDidLoad()
        XCTAssertTrue(controller.showLoadingControllerEventReceived)
        XCTAssertTrue(controller.hideLoadingControllerEventReceived)
        XCTAssertTrue(controller.showCategoriesEventReceived)
        XCTAssertEqual(controller.rows?.count, 2)
        XCTAssertTrue(controller.setTitleEventReceived)
        XCTAssertEqual(controller.navBarTitle, "Categories")
    }
    
    func testDidSelectRestaurants() {
        let model = Category.mocked(slug: .restaurants)
        categoriesAPI.models = [
            model,
            Category.mocked()
        ]
        
        restaurantsAPI.models = [
            Restaurant.mocked,
            Restaurant.mocked,
            Restaurant.mocked
        ]
        
        sut?.onViewDidLoad()
        sut?.onSelectCategory(categoryId: model.eid)
        XCTAssertTrue(delegate.didSelectRestaurants)
        XCTAssertEqual(delegate.restaurants?.count, 3)
    }
    
    func testDidSelectVacationSpots() {
        let model = Category.mocked(slug: .vacationSpots)
        categoriesAPI.models = [
            model,
            Category.mocked()
        ]
        
        vacationSpotAPI.models = [
            VacationSpot.mocked,
            VacationSpot.mocked,
            VacationSpot.mocked
        ]
        
        sut?.onViewDidLoad()
        sut?.onSelectCategory(categoryId: model.eid)
        XCTAssertTrue(delegate.didSelectVacationSpots)
        XCTAssertEqual(delegate.vacationSpots?.count, 3)
    }
    
    func testErrorFromCategoriesAPI() {
        let error = NSError(domain: Constants.Error.apiDomain,
                            code: Constants.Error.defaultErrorCode,
                            userInfo: nil)
        categoriesAPI.error = error
        
        sut?.onViewDidLoad()
        XCTAssertTrue(controller.showErrorEventReceived)
        XCTAssertEqual(controller.error?.domain, error.domain)
        XCTAssertEqual(controller.error?.code, error.code)
    }
    
    func testErrorFromRestaurantsAPI() {
        let error = NSError(domain: Constants.Error.apiDomain,
                            code: Constants.Error.defaultErrorCode,
                            userInfo: nil)
        restaurantsAPI.error = error
        
        let model = Category.mocked(slug: .restaurants)
        categoriesAPI.models = [
            model,
            Category.mocked()
        ]
        
        sut?.onViewDidLoad()
        sut?.onSelectCategory(categoryId: model.eid)
        XCTAssertTrue(controller.showErrorEventReceived)
        XCTAssertEqual(controller.error?.domain, error.domain)
        XCTAssertEqual(controller.error?.code, error.code)
    }
    
    func testErrorFromVacationSpotsAPI() {
        let error = NSError(domain: Constants.Error.apiDomain,
                            code: Constants.Error.defaultErrorCode,
                            userInfo: nil)
        
        let model = Category.mocked(slug: .vacationSpots)
        categoriesAPI.models = [
            model,
            Category.mocked()
        ]
        
        vacationSpotAPI.error = error
        
        sut?.onViewDidLoad()
        sut?.onSelectCategory(categoryId: model.eid)
        XCTAssertTrue(controller.showErrorEventReceived)
        XCTAssertEqual(controller.error?.domain, error.domain)
        XCTAssertEqual(controller.error?.code, error.code)
    }
}
