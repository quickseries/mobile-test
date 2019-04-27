//
//  CategoryViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation

import Foundation
enum categoryType {
    case kRestaurant,kVacationSpot,none
}
struct CategoryViewViewModel {
    private var category: CategoryModel
    
    private static let dateFormatter: DateFormatter = {
        $0.dateStyle = .medium
        $0.timeStyle = .none
        return $0
    }(DateFormatter())
    
    init(category: CategoryModel) {
        self.category = category
    }
    
    var title: String {
        return category.title ?? ""
    }
    
    var description: String {
        return category.description1 ?? ""
    }
    var fileName: String? {
        return category.slug 
    }
    
    var categoryType: categoryType {
        if let slug = category.slug{
            switch(slug){
            case "vacation-spots":
                return .kVacationSpot
            case "restaurants":
                return .kRestaurant
            default:
                break
            }
        }
        return .none
    }
    
    var eid: String {
        return category.eid ?? ""
    }
}
