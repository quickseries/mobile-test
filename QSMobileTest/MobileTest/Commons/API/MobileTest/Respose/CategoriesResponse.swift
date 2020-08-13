//
//  CategoriesResponse.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import Foundation


// MARK: - CategoryJSONElement
struct CategoryJSONElement: Codable {
    let id, updatedAt, slug, customModuleEid: String?
    let eid, title: String?
    let fullDescription: String?
    let v: Int?
    let active: Bool?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case updatedAt = "updated_at"
        case slug
        case customModuleEid = "custom_module_eid"
        case eid, title
        case fullDescription = "description"
        case v = "__v"
        case active = "_active"
        case createdAt = "created_at"
    }
}

// MARK: - CategoriesResponse
typealias CategoriesResponse = [CategoryJSONElement]
