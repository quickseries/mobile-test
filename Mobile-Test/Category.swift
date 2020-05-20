//
//  Category.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation

struct Category: Codable {
    let id: String
    let title: String
    let description: String?
    let type: CategoryType
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case description
        case type = "slug"
    }
}

enum CategoryType: String, Codable {
    case restaurant = "restaurants"
    case vacationSpot = "vacation-spots"
}

