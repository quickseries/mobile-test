//
//  ListResourcesViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxRelay
import Quickseries_API

protocol ListResourcesViewModel {
    
    associatedtype Entity : Resource
    associatedtype EntityCellViewModel

    var resourceEntities: [Entity] { get set }
    var resources: BehaviorRelay<[EntityCellViewModel]> { get }
    var selectedResource: BehaviorRelay<EntityCellViewModel?> { get }
    var state: BehaviorRelay<ListViewState> { get }
    
    func requestResources()
}

extension ListResourcesViewModel {
    func onResourceSelected(resource: EntityCellViewModel) {
        selectedResource.accept(resource)
    }
}

extension ListResourcesViewModel where Self : AnyObject, Entity == Restaurant, EntityCellViewModel == ResourceCellViewModel {
    
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

extension ListResourcesViewModel where Self : AnyObject, Entity == VacationSpot, EntityCellViewModel == ResourceCellViewModel {
    
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
