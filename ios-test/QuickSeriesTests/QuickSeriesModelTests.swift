//  QuickSeriesTests.swift
//  QuickSeriesTests
//
//  Created by Franck Clement on 03/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import XCTest
@testable import QuickSeries

class QuickSeriesModelTests: XCTestCase {
    
    lazy var categoriesData: Data? = {
        let bundle = Bundle(for: type(of: self))
        let categoriesURL = bundle.url(forResource: "categories", withExtension: "json")
        return try? Data(contentsOf: categoriesURL!)
    }()
    
    lazy var restaurantsData: Data? = {
        let bundle = Bundle(for: type(of: self))
        let restaurantsURL = bundle.url(forResource: "restaurants", withExtension: "json")
        return try? Data(contentsOf: restaurantsURL!)
    }()
    
    lazy var vacationsData: Data? = {
        let bundle = Bundle(for: type(of: self))
        let vacationURL = bundle.url(forResource: "vacation-spot", withExtension: "json")
        return try? Data(contentsOf: vacationURL!)
    }()

    func testDecodeCategories() {
        
        do {
            let decoder = JSONDecoder()
            let categories = try decoder.decode([QuickSeries.Category].self, from: categoriesData!)
            XCTAssertNotNil(categories)
            XCTAssertEqual(categories.count, 2)
        } catch {
            XCTFail("Categories should have been initialized from JSON data")
        }
    }
    
    func testDecodeRestaurants() {
        
        do {
            let decoder = JSONDecoder()
            let restaurants = try decoder.decode([QuickSeries.Resource].self, from: restaurantsData!)
            XCTAssertNotNil(restaurants)
            XCTAssertEqual(restaurants.count, 4)
            XCTAssertNotNil(restaurants[1].businessHour)
        } catch {
            XCTFail("Restaurants should have been initialized from JSON data")
        }
    }
    
    func testDecodeVacationSpots() {
        
        do {
            let decoder = JSONDecoder()
            let vacationSpots = try decoder.decode([QuickSeries.Resource].self, from: vacationsData!)
            XCTAssertNotNil(vacationSpots)
            XCTAssertEqual(vacationSpots.count, 1)
        } catch {
            XCTFail("VacationSpots should have been initialized from JSON data")
        }
    }
}
