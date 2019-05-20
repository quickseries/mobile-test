//
//  CategoriesWorkerTests.swift
//  TopListTests
//
//  Created by Rathish Kannan on 5/20/19.
//  Copyright © 2019 Rathish Kannan. All rights reserved.
//

import XCTest
@testable import TopList


class CategoriesWorkerTests: XCTestCase {

    static var sut: CategoriesWorker!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        setUpCategoryWorker()
    }
    
    func setUpCategoryWorker(){
        CategoriesWorkerTests.sut = CategoriesWorker.init()
    }
    
    
    // MARK: - Test doubles
    
    class CategoryMemStoreSpy: CategoriesWorker
    {
        // MARK: Method call expectations
        
        var fetchCategoriessCalled = false
        
        // MARK: Spied methods
        
        var onComplete:((_ results: [Categories]) -> Void)?

        override func fetchCategories(id: String, completionHandler: @escaping ([Categories]) -> Void) {
            fetchCategoriessCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                self.onComplete = completionHandler
                let resources = Storage.retrieve("categories", of: .json, as: [Categories].self)
                if let selectionComplete = self.onComplete {
                    selectionComplete(resources)
                }
                CategoriesWorkerTests.sut.categories = resources
            }
        }
        
    }
    
    // MARK: - Tests
    
    func testFetchCategoriesShouldReturnListOfCategory(){
        // Given
        let categoryMemStoreSpy = CategoryMemStoreSpy.init()
        
        // When
        var fetchedCategories = [Categories]()
        let expect = expectation(description: "Wait for fetchCategorie() to return")
        categoryMemStoreSpy.fetchCategories(id: "categories") { (cats) in
            fetchedCategories = cats
            expect.fulfill()
        }
        waitForExpectations(timeout: 1.1)
        
        // Then
        XCTAssert(categoryMemStoreSpy.fetchCategoriessCalled, "Calling fetchCategorie() should ask the data store for a list of orders")
        XCTAssertEqual(fetchedCategories.count, CategoriesWorkerTests.sut.categories.count , "fetchCategorie() should return a list of orders")
        for category in fetchedCategories {
            XCTAssert(CategoriesWorkerTests.sut.categories.contains(category), "Fetched cats should match the cat in the data store")
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
