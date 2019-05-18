//
//  ListCategoriesViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxRelay
import Quickseries_API

final class ListCategoriesViewModel {

    let categories = BehaviorRelay<[CategoryCellViewModel]>(value: [])
    let selectedCategory = BehaviorRelay<CategoryType?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
    
    func requestCategories() {
        state.accept(.loading)
        QuickseriesApiClient.shared.getCategories { [weak self] outcome in
            switch outcome {
            case .success(let result):
                self?.categories.accept(result.map({CategoryCellViewModel(title: $0.title, type: $0.type)}))
                self?.state.accept(.displayingData)
            case .failure(let error, let reason):
                print(error)
                self?.categories.accept([])
                self?.state.accept(.error(errorMessage: reason))
            }
        }
    }
    
    func onCategorySelected(category: CategoryCellViewModel) {
        selectedCategory.accept(category.type)
    }
}
