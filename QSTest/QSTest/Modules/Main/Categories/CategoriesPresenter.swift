//
//  CategoriesPresenter.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

protocol CategoriesPresenterDelegate: AnyObject {
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect category: Category)
}

protocol CategoriesPresenterProtocol: BasePresenterProtocol {
    func onSelectCategory(categoryId: String)
}

class CategoriesPresenter {
    private weak var delegate: CategoriesPresenterDelegate?
    private weak var controller: CategoriesControllerProtocol?
    
    private let api: CategoriesAPIClientProtocol!
    
    private var categories: Categories = []
    
    init(controller: CategoriesControllerProtocol,
         delegate: CategoriesPresenterDelegate,
         api: CategoriesAPIClientProtocol) {
        self.controller = controller
        self.delegate = delegate
        self.api = api
        
        self.controller?.presenter = self
    }
    
    private func fetchCategories() {
        controller?.showLoadingController(aboveNavBar: true)
        api.getCategories(success: { [weak self] (categories) in
            guard let self = self else { return }
            
            self.update(with: categories)
        }, failure: { [weak self] (error) in
            guard let self = self else { return }
            
            self.controller?.hideLoadingController()
            self.controller?.show(error: error)
        })
    }
    
    private func update(with categories: Categories) {
        self.controller?.hideLoadingController()
        self.categories = categories
        let modelsForUI = CategoriesFormatter.convert(categories)
        controller?.show(rows: modelsForUI)
    }
}

extension CategoriesPresenter: CategoriesPresenterProtocol {
    func onSelectCategory(categoryId: String) {
        guard let category = categories.first(where: { $0.eid == categoryId }) else { return }
        delegate?.presenter(self, didSelect: category)
    }
    
    func onViewDidLoad() {
        fetchCategories()
    }
}
