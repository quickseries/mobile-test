//
//  CategoriesViewModel.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit
import Moya
import Result

protocol CategoriesViewModelInputs {
    func bind(outputs: CategoriesViewModelOutputs) // Definitly not real binding since I am not using RX to do it...
    
    func viewWillAppear()
    func didSelectRow(row: Int)
}

protocol CategoriesViewModelOutputs: class {
    func reloadData()
}

protocol CategoriesViewModelCoordinatorOutputs: class {
    func didAskToSeeCategory(category: Category)
}

class CategoriesViewModel: NSObject {
    var inputs: CategoriesViewModelInputs {return self}
    private weak var outputs: CategoriesViewModelOutputs!
    private weak var coordinatorOutputs: CategoriesViewModelCoordinatorOutputs!
    
    private var categoriesDataProvider: DecodableDataProvider<CategoryApi>
    
    private var categories: [Category]?
    
    init(coordinatorOutputs: CategoriesViewModelCoordinatorOutputs, categoriesDataProvider: DecodableDataProvider<CategoryApi>) {
        self.coordinatorOutputs = coordinatorOutputs
        self.categoriesDataProvider = categoriesDataProvider
    }
}

// MARK: - CategoriesViewModelInputs
extension CategoriesViewModel: CategoriesViewModelInputs {
    
    func bind(outputs: CategoriesViewModelOutputs) {
        self.outputs = outputs
    }
    
    func viewWillAppear() {
        self.categoriesDataProvider.decodableRequest(.category) { [weak self] (result: Result<[Category], Error>) in
            switch result {
            case .success(let categories):
                self?.categories = categories
                self?.outputs.reloadData()
            case .failure(_):
                fatalError("Not implemented")
            }
        }
    }
    
    func didSelectRow(row: Int) {
        guard let categories = self.categories else {
            return
        }
        let categorySelected = categories[row]
        
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
        cell.config(withTitle: categoryForRow.title, description: categoryForRow.description ?? "")
        
        return cell
    }
}
