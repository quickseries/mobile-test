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
    
    associatedtype Entity
    associatedtype EntityViewModel

    var resourceEntities: [Entity] { get set }
    var resources: BehaviorRelay<[EntityViewModel]> { get }
    var selectedResource: BehaviorRelay<EntityViewModel?> { get }
    var state: BehaviorRelay<ListViewState> { get }
    
    mutating func requestResources()
}

extension ListResourcesViewModel {
    
    func onResourceSelected(resource: EntityViewModel) {
        selectedResource.accept(resource)
    }
}
