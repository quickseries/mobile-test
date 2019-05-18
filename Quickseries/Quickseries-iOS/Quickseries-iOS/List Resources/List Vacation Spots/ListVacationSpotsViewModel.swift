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

class ListVacationSpotsViewModel: ListResourcesViewModel {

    typealias Entity = VacationSpot
    typealias EntityViewModel = ResourceCellViewModel
    
    enum ViewState {
        case error(errorMessage: String)
        case loading
        case displayingData
    }
    
    var resourceEntities = [VacationSpot]()
    let resources = BehaviorRelay<[ResourceCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<ResourceCellViewModel?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
    
    func requestResources() {
        QuickseriesApiClient.shared.getVacationSpots { [weak self] outcome in
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
