//
//  CategoryListConfigurator.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

class CategoryListConfigurator {
    
    func configure(controller: CategoryListViewController) {
        
        let service = FetchCategoryListServiceImpl()
        let repository = FetchCategoryListRepositoryImpl(service: service)
        let usecase = FetchCategoryListUseCaseImpl(repository: repository)
        controller.router = CategoryListRouterImpl(viewController: controller)
        controller.presenter = CategoryListPresenterImpl(fetchCategoryListUseCase: usecase, view: controller)
    }
}
