//
//  MainFlowRouter.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import UIKit

class MainFlowRouter {
    private let navController: UINavigationController
    
    init(navController: UINavigationController, categoriesFactory: CategoriesFactoryProtocol = CategoriesFactory()) {
        self.navController = navController
        let controller = categoriesFactory.createCategoriesModule(delegate: self)
        
        navController.viewControllers = [controller]
    }
}

extension MainFlowRouter: CategoriesPresenterDelegate {
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect restaurants: Restaurants) {
        
    }
    
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect vacationSpots: VacationSpots) {
        
    }
}
