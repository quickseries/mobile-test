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
    
//    public init(from decoder: Decoder) throws {
//        let allValues = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.id = try allValues.decode(String.self, forKey: .id)
//        self.title = try allValues.decode(String.self, forKey: .title)
//        self.description = try allValues.decodeIfPresent(String.self, forKey: .description)?.html2String
//        self.categoryType = try allValues.decode(CategoryType.self, forKey: .categoryType)
//    }
}
