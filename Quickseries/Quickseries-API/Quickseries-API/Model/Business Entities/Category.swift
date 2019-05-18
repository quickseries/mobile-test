//
//  Category.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct Category: Resource, Codable {
    
    public let id: String
    public let title: String
    public let slug: String
    
    public var type: CategoryType {
        if slug == "restaurants" {
            return .restaurant
        } else {
            return .vacationSpot
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title = "title"
        case slug = "slug"
    }
}
