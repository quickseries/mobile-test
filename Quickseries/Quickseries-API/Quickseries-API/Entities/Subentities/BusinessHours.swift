//
//  BusinessHours.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

struct BusinessHours: Codable {
    
    let sunday: DayOfWeekHours?
    let monday: DayOfWeekHours?
    let tuesday: DayOfWeekHours?
    let wednesday: DayOfWeekHours?
    let thursday: DayOfWeekHours?
    let friday: DayOfWeekHours?
    let saturday: DayOfWeekHours?
    
    enum CodingKeys: String, CodingKey {
        case sunday = "sunday"
        case monday = "monday"
        case tuesday = "tuesday"
        case wednesday = "wednesday"
        case thursday = "thursday"
        case friday = "friday"
        case saturday = "saturday"
    }
}
