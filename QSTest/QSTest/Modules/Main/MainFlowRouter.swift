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
    private let resourcesFactory: ResourcesListFactoryProtocol?
    
    init(navController: UINavigationController,
         categoriesFactory: CategoriesFactoryProtocol = CategoriesFactory(),
         resourcesFactory: ResourcesListFactoryProtocol = ResourcesListFactory()) {
        self.navController = navController
        self.resourcesFactory = resourcesFactory
        
        let controller = categoriesFactory.createCategoriesModule(delegate: self)
        
        navController.viewControllers = [controller]
    }
}

extension MainFlowRouter: CategoriesPresenterDelegate {
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect restaurants: Restaurants) {
        showResourcesList(state: .restaurants(restaurants))
    }
    
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect vacationSpots: VacationSpots) {
        showResourcesList(state: .vacationSpots(vacationSpots))
    }
}

extension MainFlowRouter: ResourcesListPresenterDelegate {
    func presenter(_ presenter: ResourcesListPresenterProtocol, didSelect restaurant: Restaurant) {
        
    }
    
    func presenter(_ presenter: ResourcesListPresenterProtocol, didSelect vacationSpot: VacationSpot) {
        
    }
}

private extension MainFlowRouter {
    func showResourcesList(state: ResourcesState) {
        guard let factory = resourcesFactory else { return }
        let controller = factory.createResourcesListModule(delegate: self, state: state)
        
        navController.pushViewController(controller, animated: true)
    }
}
