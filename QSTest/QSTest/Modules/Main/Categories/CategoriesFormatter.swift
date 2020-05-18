//
//  CategoriesFormatter.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

class CategoriesFormatter {
    static func convert(_ model: Category) -> CategoryForUI {
        return CategoryForUI(title: model.title, description: model.description, id: model.eid)
    }
    
    static func convert(_ categories: Categories) -> [CategoryForUI] {
        return categories.map { CategoriesFormatter.convert($0) }
    }
}
