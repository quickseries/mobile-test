//
//  CategoryListRouter.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation
import UIKit

protocol CategoryListRouter {
    func pushResourceListScreen(with item: CategoryItem)
}

class CategoryListRouterImpl: CategoryListRouter {
    
    private weak var viewController: CategoryListViewController?
    
    init(viewController: CategoryListViewController) {
        self.viewController = viewController
    }
    
    func pushResourceListScreen(with item: CategoryItem) {
        if let resourceListViewController = ViewUtility.getResourceListViewController() {
            resourceListViewController.configurator = ResourceListConfigurator(categoryItem: item)
            viewController?.navigationController?.pushViewController(resourceListViewController, animated: true)
        }
    }
    
}
