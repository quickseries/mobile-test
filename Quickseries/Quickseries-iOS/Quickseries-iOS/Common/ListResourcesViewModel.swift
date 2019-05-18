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
    associatedtype EntityCellViewModel : ResourceCellViewModel

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
