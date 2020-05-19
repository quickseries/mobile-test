//
//  ResourcesListControllerMock.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class ResourcesListControllerMock: BaseViewControllerMock, ResourcesListControllerProtocol {
    var presenter: ResourcesListPresenterProtocol?
    
    private(set) var rows: [ResourceForUI]?
    private(set) var showResourcesEventReceived = false
    
    func show(rows: [ResourceForUI]) {
        self.rows = rows
        showResourcesEventReceived = true
    }
}
