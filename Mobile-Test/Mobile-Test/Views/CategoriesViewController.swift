//
//  CategoriesViewController.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, StoryboardBased {
    
    static var storyboardName: String = "Categories"
    
    private var viewModel: CategoriesViewModel!
    
    static func instantiate(viewModel: CategoriesViewModel) -> CategoriesViewController {
        let categoriesVC = CategoriesViewController.instantiate()
        viewModel.bind(outputs: categoriesVC)
        return categoriesVC
    }
}

// MARK: - CategoriesViewModelOutputs
extension CategoriesViewController: CategoriesViewModelOutputs {
    
}
