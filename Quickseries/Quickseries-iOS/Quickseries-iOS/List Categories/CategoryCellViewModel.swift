//
//  CategoryCellViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import Quickseries_API

struct CategoryCellViewModel : ResourceCellViewModel {
    let id: String
    let title: String
    let type: CategoryType
}
