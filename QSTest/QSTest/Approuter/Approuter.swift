//
//  Approuter.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import UIKit

class AppRouter {
    private let navController: UINavigationController
    
    private var mainFlowRouter: MainFlowRouter?
    
    init(navController: UINavigationController) {
        self.navController = navController
        showInitialFlow()
    }
    
    private func showInitialFlow() {
        mainFlowRouter = MainFlowRouter(navController: navController)
    }
}

