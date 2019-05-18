//
//  Category.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct Category: Resource, Codable {
    
    public let id: Int
    public let title: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title = "title"
    }
}
