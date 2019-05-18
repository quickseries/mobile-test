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

final class ListCategoriesViewModel : ListResourcesViewModel {
 
    typealias Entity = Quickseries_API.Category
    typealias EntityViewModel = CategoryCellViewModel
    
    var resourceEntities = [Quickseries_API.Category]()
    let resources = BehaviorRelay<[CategoryCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<Quickseries_API.Category?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
    
    func parseEntityToViewModel(_ entity: Quickseries_API.Category) -> CategoryCellViewModel {
        return CategoryCellViewModel(id: entity.id, title: entity.title, type: entity.type)
    }
    
    func requestToApi(callback: ((Outcome<[Quickseries_API.Category]>) -> ())?) {
        return QuickseriesApiClient.shared.getCategories(callback: callback)
    }
}
