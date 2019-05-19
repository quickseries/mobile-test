//
//  FetchResourceListUseCaseTests.swift
//  QuickMobileTestTests
//
//  Created by Balaji Galave on 5/19/19.
//

import XCTest
@testable import QuickMobileTest

class FetchResourceListUseCaseTests: BaseTestCase {
    
    var fetchResourceListUseCase: FetchResourceListUseCase?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
        fetchResourceListUseCase =  nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func configure() {
        let service = MockFetchResourceListService()
        let repository = FetchResourceListRepositoryImpl(service: service)
        fetchResourceListUseCase = FetchResourceListUseCaseImpl(repository: repository)
    }
    
    func testFetchResourceList_For_Restaurant() {
        let expectations = expectation(description: "closure should trigger")
        
        fetchResourceListUseCase?.fetchResourceList(for: .restaurant, completion: { (result) in
            
            switch result {
            case .success(let resources):
                
                XCTAssertEqual(resources.count, 4, "resources count must be equal")
                XCTAssertNotNil(resources.first)
                XCTAssertNotNil(resources[1])
                XCTAssertTrue(resources.first!.sectionTypes.count > 0)
                expectations.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
        wait(for: [expectations], timeout: 10)
    }
    
    func testFetchResourceList_For_VacationSpot() {
        let expectations = expectation(description: "closure should trigger")
        
        fetchResourceListUseCase?.fetchResourceList(for: .vacationSpots, completion: { (result) in
            switch result {
            case .success(let resources):
                
                XCTAssertEqual(resources.count, 1, "resources count must be equal")
                XCTAssertNotNil(resources.first)
                expectations.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
        wait(for: [expectations], timeout: 10)
    }
    
    func testFetchResourceList_For_VacationSpot_SectionItems() {
        let expectations = expectation(description: "closure should trigger")
        
        fetchResourceListUseCase?.fetchResourceList(for: .vacationSpots, completion: { (result) in
            switch result {
            case .success(let resources):
                
                XCTAssertEqual(resources.count, 1, "resources count must be equal")
                XCTAssertNotNil(resources.first)
                XCTAssertTrue(resources.first!.sectionTypes.count > 0)
                expectations.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })
        wait(for: [expectations], timeout: 10)
    }
    
    
}
