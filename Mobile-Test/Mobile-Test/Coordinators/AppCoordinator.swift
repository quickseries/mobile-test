//
//  AppCoordinator.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit
import Moya

class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    private weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let categoriesDataProvider = DecodableDataProvider<CategoryApi>()
        let mockDataProvider = DecodableDataProvider<CategoryApi>(requestClosure: DecodableDataProvider<CategoryApi>.decodableDefaultRequestMapping, stubClosure: MoyaProvider.delayedStub(1))
        // For the sake of time / this project, I am not doing a factory to get the right dataprovider based on the environment...
        let viewModel = CategoriesViewModel(coordinatorOutputs: self, categoriesDataProvider: mockDataProvider)
        self.navigationController?.pushViewController(CategoriesViewController.instantiate(viewModel: viewModel), animated: false)
    }
}

// MARK: - CategoriesViewModelCoordinatorOutputs
extension AppCoordinator: CategoriesViewModelCoordinatorOutputs {
    func didAskToSeeCategory(category: Category) {
        let mockDataProvider = DecodableDataProvider<RessourceApi>(requestClosure: DecodableDataProvider<CategoryApi>.decodableDefaultRequestMapping, stubClosure: MoyaProvider.delayedStub(1))
        let viewModel: RessourcesViewModel
        switch category.categoryType { // TODO: like I said at another place could definitly be refactored
        case .restaurants:
            viewModel = RessourcesViewModel(coordinatorOutputs: self, ressourceType: .restaurants, ressourceDataProvider: mockDataProvider)
        case .vacationSpots:
            viewModel = RessourcesViewModel(coordinatorOutputs: self, ressourceType: .vacationSpots, ressourceDataProvider: mockDataProvider)
        }
        self.navigationController?.pushViewController(RessourcesViewController.instantiate(viewModel: viewModel), animated: true)
    }
}

// MARK: - CategoriesViewModelCoordinatorOutputs
extension AppCoordinator: RessourcesViewModelCoordinatorOutputs {
    
}
