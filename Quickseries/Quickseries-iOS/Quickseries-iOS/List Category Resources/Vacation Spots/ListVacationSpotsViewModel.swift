//
//  ListVacationSpotsViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxRelay

final class ListVacationSpotsViewModel: ListResourcesViewModel, CanSortResources {
    
    typealias Entity = VacationSpot
    typealias EntityViewModel = CategoryResourceCellViewModel
    
    var sortState = ResourceSortState.unsorted
    var resourceEntities = [VacationSpot]()
    let resources = BehaviorRelay<[CategoryResourceCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<VacationSpot?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
    
    func requestToApi(callback: ((Outcome<[VacationSpot]>) -> ())?) {
        return QuickseriesApiClient.shared.getVacationSpots(callback: callback)
    }
    
    func parseEntityToViewModel(_ entity: VacationSpot) -> CategoryResourceCellViewModel {
        return CategoryResourceCellViewModel(id: entity.id, title: entity.title, type: .vacationSpot)
    }
}
