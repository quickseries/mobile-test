//
//  CanSortResources.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import Quickseries_API

protocol CanSortResources {
    
    var sortState: ResourceSortState { get set}
}

extension CanSortResources where Self : ListResourcesViewModel {
    
    func sortResources(_ r: [Self.Entity]) -> [Self.Entity] {
        switch sortState {
        case .alphabetically:
            return r.sorted { $0.title < $1.title }
        case .reverseAlphabetically:
            return r.sorted { $0.title > $1.title }
        case .unsorted:
            return r
        }
    }
    
    mutating func onSortClicked() {
        switch sortState {
        case .alphabetically:
            sortState = .reverseAlphabetically
        default:
            sortState = .alphabetically
        }
        resourceEntities = sortResources(resourceEntities)
    }
}

enum ResourceSortState {
    case alphabetically
    case reverseAlphabetically
    case unsorted
}
