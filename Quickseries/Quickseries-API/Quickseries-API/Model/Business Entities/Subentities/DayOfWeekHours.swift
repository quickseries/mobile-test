//
//  DayOfWeekHours.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct DayOfWeekHours: Codable {
    
    public let from: String
    public let to: String
    
    private enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
    }
}
