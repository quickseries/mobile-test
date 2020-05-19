//
//  ResourcesListPresenterTest.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import XCTest
@testable import QSTest

class ResourcesListPresenterTest: XCTestCase {
var sut: ResourcesListPresenter?
var delegate: ResourcesListDelegateMock!
var controller: ResourcesListControllerMock!

    override func setUp() {
        super.setUp()
        delegate = ResourcesListDelegateMock()
        controller = ResourcesListControllerMock()
        
        prepareRestaurantsSut()
    }
    
    func testOnViewDidLoadForRestaurants() {
        prepareRestaurantsSut()
        sut?.onViewDidLoad()
        
        XCTAssertFalse(controller.showLoadingControllerEventReceived)
        XCTAssertTrue(controller.showResourcesEventReceived)
        XCTAssertEqual(controller.rows?.count, 2)
        XCTAssertTrue(controller.setTitleEventReceived)
        XCTAssertEqual(controller.navBarTitle, "Restaurants")
    }
    
    func testOnViewDidLoadForVacationSpots() {
        prepareVacationSpotSut()
        sut?.onViewDidLoad()
        
        XCTAssertFalse(controller.showLoadingControllerEventReceived)
        XCTAssertTrue(controller.showResourcesEventReceived)
        XCTAssertEqual(controller.rows?.count, 3)
        XCTAssertTrue(controller.setTitleEventReceived)
        XCTAssertEqual(controller.navBarTitle, "Vacation Spots")
    }
    
    func testRestaurantSelection() {
        let model = Restaurant.mocked
        prepareRestaurantsSut(restaurant: model)
        sut?.onViewDidLoad()
        sut?.onSelectResource(with: model.eid)
        
        XCTAssertTrue(delegate.didSelectRestaurant)
        XCTAssertFalse(delegate.didSelectVacationSpot)
        XCTAssertTrue(delegate.vacationSpot == nil)
        XCTAssertEqual(delegate.restaurant?.eid, model.eid)
    }
    
    func testVacationSpotSelection() {
        let model = VacationSpot.mocked
        prepareVacationSpotSut(vacationSpot: model)
        sut?.onViewDidLoad()
        sut?.onSelectResource(with: model.eid)
        
        XCTAssertTrue(delegate.didSelectVacationSpot)
        XCTAssertFalse(delegate.didSelectRestaurant)
        XCTAssertTrue(delegate.restaurant == nil)
        XCTAssertEqual(delegate.vacationSpot?.eid, model.eid)
    }
}

private extension ResourcesListPresenterTest {
    func prepareRestaurantsSut(restaurant: Restaurant? = nil) {
        var items = [Restaurant.mocked, Restaurant.mocked]
        
        if let restaurant = restaurant {
            items.append(restaurant)
        }
        
        sut = ResourcesListPresenter(controller: controller,
                                     delegate: delegate,
                                     state: .restaurants(items))
    }
    
    func prepareVacationSpotSut(vacationSpot: VacationSpot? = nil) {
        var items = [VacationSpot.mocked,
                     VacationSpot.mocked,
                     VacationSpot.mocked]
        
        if let vacationSpot = vacationSpot {
            items.append(vacationSpot)
        }
        
        sut = ResourcesListPresenter(controller: controller,
                                     delegate: delegate,
                                     state: .vacationSpots(items))
    }
}
