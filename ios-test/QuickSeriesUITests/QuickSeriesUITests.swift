//  QuickSeriesUITests.swift
//  QuickSeriesUITests
//
//  Created by Franck Clement on 03/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import XCTest

class QuickSeriesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigation() {
        
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Restaurants"]/*[[".cells.staticTexts[\"Restaurants\"]",".staticTexts[\"Restaurants\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["The Publishing Lunch Resto"]/*[[".cells.staticTexts[\"The Publishing Lunch Resto\"]",".staticTexts[\"The Publishing Lunch Resto\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Elixor"].buttons["Restaurants"].tap()
        
        let restaurantsNavigationBar = app.navigationBars["Restaurants"]
        restaurantsNavigationBar.buttons["A-Z"].tap()
        restaurantsNavigationBar.buttons["Z-A"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["QuickSeries"]/*[[".cells.staticTexts[\"QuickSeries\"]",".staticTexts[\"QuickSeries\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["QuickSeries"].buttons["Restaurants"].tap()
        restaurantsNavigationBar.buttons["Categories"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Vacation Spots"]/*[[".cells.staticTexts[\"Vacation Spots\"]",".staticTexts[\"Vacation Spots\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["When you want to get away and read a good eGuide"]/*[[".cells.staticTexts[\"When you want to get away and read a good eGuide\"]",".staticTexts[\"When you want to get away and read a good eGuide\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Places to Read"].buttons["Vacation Spots"].tap()
        
        let vacationSpotsNavigationBar = app.navigationBars["Vacation Spots"]
        vacationSpotsNavigationBar.buttons["A-Z"].tap()
        vacationSpotsNavigationBar.buttons["Z-A"].tap()
        vacationSpotsNavigationBar.buttons["Categories"].tap()

    }
    

}
