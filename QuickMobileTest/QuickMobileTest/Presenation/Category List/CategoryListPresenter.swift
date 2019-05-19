//
//  CategoryListPresenter.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

protocol CategoryListPresenter {
    func fetchCategoryList()
    func category(at index: Int) -> CategoryItem?
    var countOfCategories: Int { get }
}

class CategoryListPresenterImpl {
    
    private var categoryItems = [CategoryItem]()
    private let fetchCategoryListUseCase: FetchCategoryListUseCase
    private weak var view: CategoryListView?
    
    init(fetchCategoryListUseCase: FetchCategoryListUseCase, view: CategoryListView) {
        self.fetchCategoryListUseCase = fetchCategoryListUseCase
        self.view = view
        fetchCategoryList()
    }
    
}

extension CategoryListPresenterImpl: CategoryListPresenter {
    
    func fetchCategoryList() {
        
        fetchCategoryListUseCase.fetchCategoryList { [weak self] (result ) in
            switch result {
            case .success(let items):
                self?.categoryItems = items
                DispatchQueue.main.async {
                    self?.view?.reloadData()
                }
                
            case .failure(let error):
                Logger.log(message: "\(error.localizedDescription)", messageType: .error)
            }
        }
    }
    
    func category(at index: Int) -> CategoryItem? {
        if index < categoryItems.count {
            return categoryItems[index]
        }
        return nil
    }
    
    var countOfCategories: Int {
        return categoryItems.count
    }
    
}
