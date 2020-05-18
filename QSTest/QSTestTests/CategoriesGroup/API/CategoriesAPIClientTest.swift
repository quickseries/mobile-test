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

extension URLSessionMock {
    class func categoryMockedSession(with file: String?, error: Error?) -> URLSessionMock {
        let sessionMock = URLSessionMock()
        
        if let fileName = file {
            sessionMock.data = Data.load(from: fileName, bundle: Bundle(for: URLSessionMock.self))
        }
        
        sessionMock.error = error
        
        return sessionMock
    }
}

class CategoriesAPIClientTest: XCTestCase {
    var networkSession: URLSessionMock!
    var sut: CategoriesAPIClient?
    var models: Categories?
    var error: NSError?
    
    override func setUp() {
        super.setUp()
        networkSession = URLSessionMock.categoryMockedSession(with: "categories", error: nil)
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
}
