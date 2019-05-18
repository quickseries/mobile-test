//
//  CategoryListApiToUIMapper.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

struct CategoryListApiToUIMapper {
    
    static func convert(from responses: [CategoryResponse]) -> [CategoryItem] {
        let categoryItems = responses.compactMap { (response) -> CategoryItem? in
            guard let type = getCategoryType(from: response.slug) else { return nil }
            return CategoryItem(title: response.title ?? "", description: response.description, type: type)
        }
        return categoryItems
    }
    
    private  static func getCategoryType(from slug: String?) -> CategoryType? {
        switch slug {
        case "restaurants":
            return .restaurant
        case "vacation-spots":
            return .vacationSports
        default:
            return nil
        }
    }
}
