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
    
    var resourceEntities = [VacationSpot]()
    let resources = BehaviorRelay<[ResourceCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<ResourceCellViewModel?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
}
