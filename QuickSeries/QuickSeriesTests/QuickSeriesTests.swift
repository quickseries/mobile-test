//
//  QuickSeriesTests.swift
//  QuickSeriesTests
//
//  Created by Engineer 144 on 17/05/2019.
//

import XCTest
@testable import QuickSeries

class QuickSeriesTests: XCTestCase {
    private var categoriesviewModel : CategoriesViewModel!
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
    
    
    func testCategoriesViewModel()  {
        
      self.categoriesviewModel = CategoriesViewModel(key: "")
        
       
       
         XCTAssertNotNil(self.categoriesviewModel)
       
    }
    func testOperations(){
        
       _ =  dataLoader.loadData(fileName: JsonFiles.category) { (data) in
        
        
        XCTAssert((data as! Data).base64EncodedData().count  == 0)
        XCTAssertNotNil(data)
        
        }
        
    
        
    }
    
    
   
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
