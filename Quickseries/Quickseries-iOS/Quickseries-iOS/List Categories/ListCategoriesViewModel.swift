//
//  ListCategoriesViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxRelay
import Quickseries_API

final class ListCategoriesViewModel : ListResourcesViewModel {
    
    typealias Entity = Quickseries_API.Category
    typealias EntityViewModel = ResourceCellViewModel
    
    var resourceEntities = [Quickseries_API.Category]()
    let resources = BehaviorRelay<[ResourceCellViewModel]>(value: [])
    let selectedResource = BehaviorRelay<ResourceCellViewModel?>(value: nil)
    let state = BehaviorRelay<ListViewState>(value: .loading)
}

extension ListResourcesViewModel where Self : AnyObject, Entity == Quickseries_API.Category, EntityCellViewModel == ResourceCellViewModel {
    func requestResources() {
        QuickseriesApiClient.shared.getCategories { [weak self] outcome in
            switch outcome {
            case .success(let result):
                self?.resourceEntities = result
                self?.resources.accept(result.map({ResourceCellViewModel(id: $0.id, title: $0.title, type: $0.type)}))
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
