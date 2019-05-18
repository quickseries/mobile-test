//
//  BusinessHours.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct BusinessHours: Codable {
    
    public let sunday: DayOfWeekHours?
    public let monday: DayOfWeekHours?
    public let tuesday: DayOfWeekHours?
    public let wednesday: DayOfWeekHours?
    public let thursday: DayOfWeekHours?
    public let friday: DayOfWeekHours?
    public let saturday: DayOfWeekHours?
    
    private enum CodingKeys: String, CodingKey {
        case sunday = "sunday"
        case monday = "monday"
        case tuesday = "tuesday"
        case wednesday = "wednesday"
        case thursday = "thursday"
        case friday = "friday"
        case saturday = "saturday"
    }
}
