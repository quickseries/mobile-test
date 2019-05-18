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

final class ListVacationSpotsViewModel: ListResourcesViewModel, CanSortResources {
    
    typealias Entity = VacationSpot
    typealias EntityViewModel = CategoryResourceCellViewModel
    
    var sortState = ResourceSortState.unsorted
    var resourceEntities = [VacationSpot]()
    let resources = BehaviorRelay<[CategoryResourceCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<CategoryResourceCellViewModel?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
}

extension ListResourcesViewModel where Self : AnyObject, Self : CanSortResources, Entity == VacationSpot, EntityCellViewModel == CategoryResourceCellViewModel {
    
    func requestResources() {
        QuickseriesApiClient.shared.getVacationSpots { [weak self] outcome in
            switch outcome {
            case .success(let result):
                if let sorted = self?.sortResources(result) {
                    self?.resourceEntities = sorted
                    let viewModels = sorted.map({CategoryResourceCellViewModel(id: $0.id, title: $0.title, type: .restaurant)})
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
