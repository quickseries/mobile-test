//
//  BaseViewControllerMock.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class BaseViewControllerMock: BaseViewControllerProtocol {
    var loadingController: LoadingViewController?
    
    private(set) var showErrorEventReceived = false

    private(set) var showLoadingControllerEventReceived = false
    private(set) var hideLoadingControllerEventReceived = false
    
    private(set) var setTitleEventReceived = false
    
    private(set) var errorMessage: String?
    private(set) var errorTitle: String?
    private(set) var error: NSError?
    private(set) var navBarTitle: String?
    
    func set(title: String) {
        navBarTitle = title
        setTitleEventReceived = true
    }
    
    func show(error: NSError) {
        showErrorEventReceived = true
        self.error = error
    }
    
    func show(message: String, title: String?) {
        showErrorEventReceived = true
        errorTitle = title
        errorMessage = message
    }
    
    func showLoadingController(aboveNavBar: Bool) {
        showLoadingControllerEventReceived = true
    }
    
    func hideLoadingController() {
        hideLoadingControllerEventReceived = true
    }
}
