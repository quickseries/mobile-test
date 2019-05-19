//
//  ResourceDetailsConfigurator.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

class ResourceDetailsConfigurator {
    
    private let resourceItem: ResourceItem
    
    init(resourceItem: ResourceItem) {
        self.resourceItem = resourceItem
    }
    
    func configure(controller: ResourceDetailsViewController) {
        controller.router = ResourceDetailsRouterImpl(viewController: controller)
        controller.presenter = ResourceDetailsPresenterImpl(categoryItem: resourceItem, view: controller)
    }
}
