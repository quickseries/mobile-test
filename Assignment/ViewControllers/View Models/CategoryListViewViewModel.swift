//
//  CategoryListViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//


import Foundation
import RxSwift
import RxCocoa

class CategoryListViewViewModel {
    
    private let dataStore: DataStore
    private let disposeBag = DisposeBag()
    
    init(fileName: Driver<String>, dataStore: DataStore) {
        self.dataStore = dataStore
        fileName
            .drive(onNext: { [weak self] (fileName) in
                print(fileName)
                self?.fetchCategories(fileName: fileName)
            }).disposed(by: disposeBag)
    }
    private let _categories = BehaviorRelay<[CategoryModel]>(value: [])
    private let _isFetching = BehaviorRelay<Bool>(value: false)
    private let _error = BehaviorRelay<String?>(value: nil)
    
    var isFetching: Driver<Bool> {
        return _isFetching.asDriver()
    }
    
    var categories: Driver<[CategoryModel]> {
        return _categories.asDriver()
    }
    
    var error: Driver<String?> {
        return _error.asDriver()
    }
    
    var hasError: Bool {
        return _error.value != nil
    }
    
    var numberOfCategories: Int {
        return _categories.value.count
    }
    
    func viewModelForCategory(at index: Int) -> CategoryViewViewModel? {
        guard index < _categories.value.count else {
            return nil
        }
        return CategoryViewViewModel(category: _categories.value[index])
    }
    
    private func fetchCategories(fileName: String) {
        self._categories.accept([])
        self._isFetching.accept(true)
        self._error.accept(nil)
        
        dataStore.fetchCategories(fromFile: fileName, successHandler: {[weak self] (categoriesArr) in
            print(categoriesArr)
            self?._isFetching.accept(false)
            self?._categories.accept(categoriesArr)
        }) {[weak self](error) in
            print(error)
            self?._isFetching.accept(false)
            self?._error.accept(error.localizedDescription)
        }
    }
    
}

