//
//  FetchCategoryListUseCaseTests.swift
//  QuickMobileTestTests
//
//  Created by Balaji Galave on 5/19/19.
//

import XCTest
@testable import QuickMobileTest

class FetchCategoryListUseCaseTests: BaseTestCase {
    
    var fetchCategoryListUseCase: FetchCategoryListUseCase?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func configure() {
        let service = MockFetchCategoryListService()
        let repository = FetchCategoryListRepositoryImpl(service: service)
        fetchCategoryListUseCase = FetchCategoryListUseCaseImpl(repository: repository)
    }
    
    func testFetchCategoryList() {
        let expectations = expectation(description: "closure should trigger")
        fetchCategoryListUseCase?.fetchCategoryList(completion: { (result) in
            switch result {
            case .success(let categories):
                
                XCTAssertEqual(categories.count, 2, "categories must be equal")
                XCTAssertNotNil(categories.first)
                XCTAssertNotNil(categories[1])
                XCTAssertEqual(categories.first?.title, "Restaurants", "Both strings should be equal")
                XCTAssertEqual(categories[1].title, "Vacation Spots", "Both strings should be equal")
                
                expectations.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
        wait(for: [expectations], timeout: 10)
    }
    
}
