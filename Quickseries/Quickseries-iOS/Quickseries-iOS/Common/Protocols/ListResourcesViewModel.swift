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

protocol ListResourcesViewModel : AnyObject {
    
    associatedtype Entity : Resource
    associatedtype EntityCellViewModel : ResourceCellViewModel

    var resourceEntities: [Entity] { get set }
    var resources: BehaviorRelay<[EntityCellViewModel]> { get }
    var selectedResource: BehaviorRelay<EntityCellViewModel?> { get }
    var state: BehaviorRelay<ListViewState> { get }
    
    func requestToApi(callback: ((Outcome<[Entity]>) -> ())?)
    func parseEntityToViewModel(_ entity: Entity) -> EntityCellViewModel
    func requestResources()
}

extension ListResourcesViewModel {
    
    func requestResources() {
        requestToApi { outcome in
            switch outcome {
            case .success(let result):
                self.resourceEntities = result
                let viewModels = result.map({ return self.parseEntityToViewModel($0)})
                self.resources.accept(viewModels)
                self.state.accept(.displayingData)
            case .failure(let error, let reason):
                print(error)
                self.resourceEntities = []
                self.resources.accept([])
                self.state.accept(.error(errorMessage: reason))
            }
        }
    }
    
    func onResourceSelected(resource: EntityCellViewModel) {
        selectedResource.accept(resource)
    }
}

enum ListViewState {
    case error(errorMessage: String)
    case loading
    case displayingData
}
