//
//  CategoriesPresenterDelegateMock.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class CategoriesPresenterDelegateMock: CategoriesPresenterDelegate {
    var didSelectCategory = false
    var category: QSTest.Category?
    
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect category: QSTest.Category) {
        self.didSelectCategory = true
        self.category = category
    }
}
