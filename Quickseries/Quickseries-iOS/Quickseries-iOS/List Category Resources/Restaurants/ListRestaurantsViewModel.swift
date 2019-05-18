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
    let selectedResource = BehaviorRelay<CategoryResourceCellViewModel?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
}

extension ListResourcesViewModel where Self : AnyObject, Self : CanSortResources, Entity == Restaurant, EntityCellViewModel == CategoryResourceCellViewModel {
    
    func requestResources() {
        QuickseriesApiClient.shared.getRestaurants { [weak self] outcome in
            switch outcome {
            case .success(let result):
                if let sorted = self?.sortResources(result) {
                    self?.resourceEntities = sorted
                    let viewModels = sorted.map({CategoryResourceCellViewModel(id: $0.id, title: $0.title, type: .restaurant)})
                    self?.resources.accept(viewModels)
                }
                self?.state.accept(.displayingData)
            case .failure(let error, let reason):
                print(error)
                self?.resourceEntities = []
                self?.resources.accept([])
                self?.state.accept(.error(errorMessage: reason))
            }
        }
    }
}
