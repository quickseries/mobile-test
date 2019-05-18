//
//  RestaurantCellViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import Quickseries_API

protocol ResourceCellViewModel {
    var id: String { get }
    var title: String { get }
    var type: CategoryType { get }
}
