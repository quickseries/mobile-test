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
}
