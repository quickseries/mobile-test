//
//  DayOfWeekHours.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

struct DayOfWeekHours: Codable {
    
    let from: String
    let to: String
    
    enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
    }
}
