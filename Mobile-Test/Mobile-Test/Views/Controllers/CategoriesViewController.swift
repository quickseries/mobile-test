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
    
    @IBOutlet private weak var categoriesTableView: UITableView!
    
    private var viewModel: CategoriesViewModel!
    
    static func instantiate(viewModel: CategoriesViewModel) -> CategoriesViewController {
        let categoriesVC = CategoriesViewController.instantiate()
        viewModel.bind(outputs: categoriesVC)
        return categoriesVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoriesTableView.register(cellType: CategoryTableViewCell.self)
        self.categoriesTableView.delegate = self
        self.categoriesTableView.dataSource = self.viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.inputs.viewWillAppear()
    }
}

// MARK: - CategoriesViewModelOutputs
extension CategoriesViewController: CategoriesViewModelOutputs {
    func displayCategories(categories: [Category]) {
        // TODO:
    }
}

extension CategoriesViewController: UITableViewDelegate {
    
}
