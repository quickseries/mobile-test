//
//  Category.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Foundation

struct Category: Codable {

    var id: String
    var title: String
    var description: String?
    var categoryType: CategoryType
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case categoryType = "slug"
        case title, description
    }
    
    enum CategoryType: String, Codable {
        case restaurants
        case vacationSpots = "vacation-spots"
    }
}
