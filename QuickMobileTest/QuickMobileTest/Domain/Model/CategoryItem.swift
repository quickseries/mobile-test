//
//  CategoryItem.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

struct CategoryItem {
    let title: String
    let description: String
    let type: CategoryType
}

enum CategoryType {
    case restaurant, vacationSports
}
