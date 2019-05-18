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

final class ListRestaurantsViewModel : ListResourcesViewModel {
    
    typealias Entity = Restaurant
    typealias EntityViewModel = ResourceCellViewModel
    
    var resourceEntities = [Restaurant]()
    
    let resources = BehaviorRelay<[ResourceCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<ResourceCellViewModel?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
    
    func requestResources() {
        QuickseriesApiClient.shared.getRestaurants { [weak self] outcome in
            switch outcome {
            case .success(let result):
                self?.resourceEntities = result
                self?.resources.accept(result.map({ResourceCellViewModel(id: $0.id, title: $0.title)}))
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
