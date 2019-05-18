//
//  ResourceListConfigurator.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

class ResourceListConfigurator {
    
    private let categoryItem: CategoryItem
    
    init(categoryItem: CategoryItem) {
        self.categoryItem = categoryItem
    }
    
    func configure(controller: ResourceListViewController) {
        
        let service = FetchResourceListServiceImpl()
        let repository = FetchResourceListRepositoryImpl(service: service)
        let usecase = FetchResourceListUseCaseImpl(repository: repository)
        controller.router = ResourceListRouterImpl(viewController: controller)
        controller.presenter = ResourceListPresenterImpl(fetchResourceListUseCase: usecase, view: controller, categoryItem: categoryItem)
    }
}
