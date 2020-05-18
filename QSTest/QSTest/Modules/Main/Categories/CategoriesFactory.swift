//
//  CategoriesFactory.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

protocol CategoriesFactoryProtocol {
    func createCategoriesModule(delegate: CategoriesPresenterDelegate) -> CategoriesController
}

class CategoriesFactory: CategoriesFactoryProtocol {
    func createCategoriesModule(delegate: CategoriesPresenterDelegate) -> CategoriesController {
        let controller = CategoriesController(loadType: .xib)
        let _ = CategoriesPresenter(controller: controller,
                                    delegate: delegate)
        
        return controller
    }
}
