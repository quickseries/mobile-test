//
//  CategoriesViewModel.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

protocol CategoriesViewModelInputs {
    func bind(outputs: CategoriesViewModelOutputs) // Definitly not real binding since I am not using RX to do it...
    
    func viewWillAppear()
}

protocol CategoriesViewModelOutputs: class {
    func displayCategories(categories: [Category])
}

protocol CategoriesViewModelCoordinatorOutputs: class {
    
}

class CategoriesViewModel {
    var inputs: CategoriesViewModelInputs {return self}
    private weak var outputs: CategoriesViewModelOutputs!
    private weak var coordinatorOutputs: CategoriesViewModelCoordinatorOutputs!
    
    private var categoriesDatasource: CategoriesDatasource
    
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
    }
}
