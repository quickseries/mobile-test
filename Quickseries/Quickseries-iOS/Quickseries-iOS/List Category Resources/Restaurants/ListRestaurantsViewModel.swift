//
//  ListRestaurantsViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxRelay
import Quickseries_API

final class ListRestaurantsViewModel : ListResourcesViewModel, CanSortResources {
  
    typealias Entity = Restaurant
    typealias EntityViewModel = CategoryResourceCellViewModel
    
    var sortState = ResourceSortState.unsorted
    var resourceEntities = [Restaurant]()
    let resources = BehaviorRelay<[CategoryResourceCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<Restaurant?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
    
    func requestToApi(callback: ((Outcome<[Restaurant]>) -> ())?) {
        return QuickseriesApiClient.shared.getRestaurants(callback: callback)
    }
    
    func parseEntityToViewModel(_ entity: Restaurant) -> CategoryResourceCellViewModel {
        return CategoryResourceCellViewModel(id: entity.id, title: entity.title, type: .vacationSpot)
    }
}
