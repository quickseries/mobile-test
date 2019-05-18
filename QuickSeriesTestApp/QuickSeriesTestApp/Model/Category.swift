//
//  Category.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import Foundation

// this model is a simple one and is not a good fit for ViewModel

struct Category: Decodable {
    let title: String
    let description: String?
    let slug: String
}
