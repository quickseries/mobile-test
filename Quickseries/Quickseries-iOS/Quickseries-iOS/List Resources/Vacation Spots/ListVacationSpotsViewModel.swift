//
//  ListVacationSpotsViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxRelay
import Quickseries_API

class ListVacationSpotsViewModel: ListResourcesViewModel, CanSortResources {
    
    typealias Entity = VacationSpot
    typealias EntityViewModel = ResourceCellViewModel
    
    var sortState = ResourceSortState.unsorted
    var resourceEntities = [VacationSpot]()
    let resources = BehaviorRelay<[ResourceCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<ResourceCellViewModel?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
}

extension ListResourcesViewModel where Self : AnyObject, Self : CanSortResources, Entity == VacationSpot, EntityCellViewModel == ResourceCellViewModel {
    
    func requestResources() {
        QuickseriesApiClient.shared.getVacationSpots { [weak self] outcome in
            switch outcome {
            case .success(let result):
                if let sorted = self?.sortResources(result) {
                    self?.resourceEntities = sorted
                    let viewModels = sorted.map({ResourceCellViewModel(id: $0.id, title: $0.title, type: .restaurant)})
                    self?.resources.accept(viewModels)
                }
            case .failure(let error, let reason):
                print(error)
                self?.resourceEntities = []
                self?.resources.accept([])
                self?.state.accept(.error(errorMessage: reason))
            }
        }
    }
}
