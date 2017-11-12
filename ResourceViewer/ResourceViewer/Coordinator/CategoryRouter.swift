//
//  CategoryRouter.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit

class CategoryRouter: Router {
    
    unowned var viewModel: CategoryViewModel
    
    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
    }
    
    func route(
        to routeID: String,
        from context: UIViewController,
        parameters: Any?)
    {
    }
}
