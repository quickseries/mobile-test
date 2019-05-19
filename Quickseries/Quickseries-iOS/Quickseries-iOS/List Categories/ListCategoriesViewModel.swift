//
//  ListCategoriesViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxRelay

final class ListCategoriesViewModel : ListResourcesViewModel {
 
    typealias Entity = Category
    typealias EntityViewModel = CategoryCellViewModel
    
    var resourceEntities = [Category]()
    let resources = BehaviorRelay<[CategoryCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<Category?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
    
    func parseEntityToViewModel(_ entity: Category) -> CategoryCellViewModel {
        return CategoryCellViewModel(id: entity.id, title: entity.title, type: entity.type)
    }
    
    func requestToApi(callback: ((Outcome<[Category]>) -> ())?) {
        return QuickseriesApiClient.shared.getCategories(callback: callback)
    }
}
