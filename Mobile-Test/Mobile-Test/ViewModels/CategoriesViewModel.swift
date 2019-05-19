//
//  CategoriesViewModel.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit

protocol CategoriesViewModelInputs {
    func bind(outputs: CategoriesViewModelOutputs) // Definitly not real binding since I am not using RX to do it...
    
    func viewWillAppear()
    func didAskToSeeCategory(withId id: String)
}

protocol CategoriesViewModelOutputs: class {
    func displayCategories(categories: [Category])
}

protocol CategoriesViewModelCoordinatorOutputs: class {
    func didAskToSeeCategory(category: Category)
}

class CategoriesViewModel: NSObject {
    var inputs: CategoriesViewModelInputs {return self}
    private weak var outputs: CategoriesViewModelOutputs!
    private weak var coordinatorOutputs: CategoriesViewModelCoordinatorOutputs!
    
    private var categoriesDatasource: CategoriesDatasource
    
    private var categories: [Category]?
    
    init(coordinatorOutputs: CategoriesViewModelCoordinatorOutputs, categoriesDatasource: CategoriesDatasource) {
        self.coordinatorOutputs = coordinatorOutputs
        self.categoriesDatasource = categoriesDatasource
    }
}

// MARK: - CategoriesViewModelInputs
extension CategoriesViewModel: CategoriesViewModelInputs {
    func bind(outputs: CategoriesViewModelOutputs) {
        self.outputs = outputs
    }
    
    func viewWillAppear() {
        let loadedCategories = self.categoriesDatasource.load()
        self.outputs.displayCategories(categories: loadedCategories)
        
        self.categories = self.categoriesDatasource.load()
    }
    
    func didAskToSeeCategory(withId id: String) {
        let categorySelectedOptional = self.categoriesDatasource.load().first {
            return $0.id == id
        }
        guard let categorySelected = categorySelectedOptional else {return}
        
        self.coordinatorOutputs.didAskToSeeCategory(category: categorySelected)
    }
}

// MARK: - UITableViewDataSource
extension CategoriesViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let categories = self.categories else {
            fatalError()
        }
        let categoryForRow = categories[indexPath.row]
        
        let cell: CategoryTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.config(withTitle: categoryForRow.title, description: categoryForRow.description)
        
        return cell
    }
}
