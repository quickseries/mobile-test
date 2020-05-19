//
//  CategoriesAPIClientTest.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import XCTest
import Foundation
@testable import QSTest

class CategoriesAPIClientTest: XCTestCase {
    var networkSession: URLSessionMock!
    var sut: CategoriesAPIClient?
    var models: Categories?
    var error: NSError?
    
    override func setUp() {
        super.setUp()
        networkSession = URLSessionMock.mockedSession(with: "categories", error: nil)
        guard let baseURL = URL(string: Constants.API.baseURL) else { return }
        sut = CategoriesAPIClient(baseUrl: baseURL, validateStatusCode: false, sessionManager: networkSession)
    }
    
    private func makeGetCategoriesCall() {
        sut?.getCategories(success: { (models) in
            self.models = models
        }, failure: { (error) in
            self.error = error
        })
    }
    
    func testGetCategoriesSuccess() {
        networkSession.error = nil
        makeGetCategoriesCall()
        
        XCTAssertNil(error)
        XCTAssertEqual(models?.count, 2)
    }
    
    func testGetCategoriesFailure() {
        let error = NSError(domain: Constants.Error.apiDomain,
                            code: Constants.Error.defaultErrorCode,
                            userInfo: nil)
        
        networkSession.error = error
        networkSession.data = nil
        makeGetCategoriesCall()
        
        XCTAssertNil(models)
        XCTAssertNotNil(error)
    }
}
