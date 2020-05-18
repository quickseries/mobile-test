//
//  File.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class CategoriesAPIProtocolMock: CategoriesAPIClientProtocol {
    var models: Categories?
    var error: NSError?
    
    private(set) var getCategoriesEventReceived = false
    
    func getCategories(success: APICategoriesSuccessCallback?, failure: APIFailureCallback?) {
        getCategoriesEventReceived = true
        
        if let mockedModels = models {
            success?(mockedModels)
        } else if let error = error {
            failure?(error)
        }
    }
}
