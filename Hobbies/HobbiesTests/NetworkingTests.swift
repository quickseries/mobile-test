//
//  HobbiesTests.swift
//  HobbiesTests
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import XCTest
@testable import Hobbies

class NetworkingTests: XCTestCase
{
    let categoryServices = CategoryServices()
    let detailServices = DetailServices()
    func testGetAllCategoryServices()
    {
        let expectation = XCTestExpectation(description: "category list test")
        self.categoryServices.getAllCategories { (categories, error) in
            XCTAssertNil(error, "api error = \(String(describing: error?.description))")
            XCTAssertNotNil(categories, "categories is nil")
            for category in categories! {
                self.check(category: category)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
    }
    
    func testGetAllVacationDetailsWorks()
    {
        let expectation = XCTestExpectation(description: "vacation list test")
        self.detailServices.getAListOf(.vacations) { (vacations, error) in
            XCTAssertNil(error, "api error = \(String(describing: error?.description))")
            XCTAssertNotNil(vacations, "vacations is nil")
            let vacationResult = vacations as? [VacationModel]
            XCTAssertNotNil( vacationResult, "can't convert result to vacation model")
            for vacation in vacationResult! {
                self.check(vacation: vacation)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
    }
    func testGetAllRestuarantsDetailsWorks()
    {
        let expectation = XCTestExpectation(description: "restaurant list test")
        self.detailServices.getAListOf(.restaurants) { (restaurants, error) in
            XCTAssertNil(error, "api error = \(String(describing: error?.description))")
            XCTAssertNotNil(restaurants, "vacations is nil")
            let restaurantResult = restaurants as? [RestaurantModel]
            XCTAssertNotNil( restaurantResult, "can't convert result to vacation model")
            for restaurant in restaurantResult! {
                self.check(restaurant: restaurant)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
    }
    
}

extension NetworkingTests
{
    func check(category: CategoryModel)
    {
        XCTAssertNotNil(category.id, "category id is nil error - id \(category.id!)")
        XCTAssertNotNil(category.updatedAt, "category updatedAt is nil error - id \(category.id!)")
        XCTAssertNotNil(category.title, "category title is nil error - id \(category.id!)")
        XCTAssertNotNil(category.active, "category active is nil error - id \(category.id!)")
        XCTAssertNotNil(category.createdAt, "category createdAt is nil error - id \(category.id!)")
    }
 
    func check(restaurant: RestaurantModel)
    {
        XCTAssertNotNil(restaurant.id, "restaurant id is nil error - id \(restaurant.id!)")
        XCTAssertNotNil(restaurant.updatedAt, "restaurant updatedAt is nil error - id \(restaurant.id!)")
        XCTAssertNotNil(restaurant.title, "restaurant title is nil error - id \(restaurant.id!)")
        XCTAssertNotNil(restaurant.active, "restaurant active is nil error - id \(restaurant.id!)")
        XCTAssertNotNil(restaurant.createdAt, "restaurant createdAt is nil error - id \(restaurant.id!)")
    }
    func check(vacation: VacationModel)
    {
        XCTAssertNotNil(vacation.id, "category id is nil error - id \(vacation.id!)")
        XCTAssertNotNil(vacation.updatedAt, "category updatedAt is nil error - id \(vacation.id!)")
        XCTAssertNotNil(vacation.title, "category title is nil error - id \(vacation.id!)")
        XCTAssertNotNil(vacation.active, "category active is nil error - id \(vacation.id!)")
        XCTAssertNotNil(vacation.createdAt, "category createdAt is nil error - id \(vacation.id!)")
    }
}

