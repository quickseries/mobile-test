//
//  QuickSeriesTests.swift
//  QuickSeriesTests
//
//  Created by Engineer 144 on 17/05/2019.
//

import XCTest
@testable import QuickSeries

class QuickSeriesTests: XCTestCase {
private let dataLoader = QuickOperationManager()
     let jsonDecoder = JSONDecoder()
      var totalCount = 0
   var categoryItemViewModels : [CategoryItemViewModel] = [CategoryItemViewModel]()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testResourceCount(){
        
      
        loadCategoriesItem(_fileName: "restaurants")
        loadCategoriesItem(_fileName: "vacation-spot")
        
        
        
        
         XCTAssert(self.totalCount == 5)
         XCTAssert(self.totalCount < 5)
    }

    
    func testHasworkingDays(){
        
        
    }
    
    
    func loadCategoriesItem(_fileName: String){
        
        
        dataLoader.loadData(fileName: _fileName) { [unowned self] data in
            
            
            mainThread {
                do {
                    let response = try self.jsonDecoder.decode(CategoryItems.self, from: data as! Data)
                    let list = response.compactMap({ (element) in
                        
                        CategoryItemViewModel(object: element)
                        
                    })
                    
                    
                    self.categoryItemViewModels.append(contentsOf: list)
                    
                    
                    self.totalCount += self.categoryItemViewModels.count
                    
                    
                    
                }catch{
                    
                    
                }
            }
            
            
            
        }
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
