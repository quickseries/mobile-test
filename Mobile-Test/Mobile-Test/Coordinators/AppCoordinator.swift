//
//  AppCoordinator.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    private weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let categoriesDataSource = CategoriesDatasource()
        let viewModel = CategoriesViewModel(coordinatorOutputs: self, categoriesDatasource: categoriesDataSource)
        self.navigationController?.pushViewController(CategoriesViewController.instantiate(viewModel: viewModel), animated: false)
    }
}

// MARK: - CategoriesViewModelCoordinatorOutputs
extension AppCoordinator: CategoriesViewModelCoordinatorOutputs {
    func didAskToSeeCategory(category: Category) {
        
    }
}
