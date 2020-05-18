//
//  File.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class CategoriesControllerMock: BaseViewControllerMock, CategoriesControllerProtocol {
    var presenter: CategoriesPresenterProtocol?
    
    private(set) var rows: [CategoryForUI]?
    private(set) var showCategoriesEventReceived = false
    
    func show(rows: [CategoryForUI]) {
        self.rows = rows
        self.showCategoriesEventReceived = true
    }
}
