//
//  ResourceListRouter.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

protocol ResourceListRouter {
    func pushResourceDetailScreen(with item: ResourceItem)
}

class ResourceListRouterImpl: ResourceListRouter {
    
    private weak var viewController: ResourceListViewController?
    
    init(viewController: ResourceListViewController) {
        self.viewController = viewController
    }
    
    func pushResourceDetailScreen(with item: ResourceItem) {
        
    }
}
