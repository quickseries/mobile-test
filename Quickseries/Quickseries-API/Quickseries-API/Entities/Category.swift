//
//  Category.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

struct Category: Resource, Codable {
    
    let id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title = "title"
    }
}
