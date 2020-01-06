//  Category.swift
//  QuickSeries
//
//  Created by Franck Clement on 03/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import Foundation

/// Category is part of the model layer.
/// Categories are retreived from webservices,
/// and shown when the app is launched
struct Category: Decodable {
    
    let id: String
    let title: String
    let subtitle: String?
    let type: CategoryType

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case subtitle = "description"
        case type = "slug"
    }
}

/// The CategoryType determine the type of a category
/// If Categories are added in the future, simply add a new enum entry
/// whith the `slug` value as a String.
enum CategoryType: String, Decodable {
    case restaurant = "restaurants"
    case vacationSpot = "vacation-spots"
}
