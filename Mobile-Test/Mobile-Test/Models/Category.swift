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
    var updatedAt: String
    var title: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case updatedAt = "updated_at"
        case title, description
    }
}
