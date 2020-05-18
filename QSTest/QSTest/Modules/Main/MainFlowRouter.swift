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
    
    init(navController: UINavigationController) {
        self.navController = navController
        
        guard let  baseURL = URL(string: Constants.API.baseURL) else {
            fatalError("CategoriesRouter: URL initialization issue")
        }
        
        let api  = CategoriesAPIClient(baseUrl: baseURL,
                                       validateStatusCode: false,
                                       sessionManager: URLSession.default)
        
        let controller = CategoriesController(loadType: .xib)
        let _ = CategoriesPresenter(controller: controller,
                                    delegate: self,
                                    api: api)
        
        navController.viewControllers = [controller]
    }
}

extension MainFlowRouter: CategoriesPresenterDelegate {
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect category: Category) {
        
    }
}
