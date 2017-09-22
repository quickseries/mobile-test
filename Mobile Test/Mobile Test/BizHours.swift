//
//  BizHours.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import Foundation

enum BizHoursFields:String {
    case monday = "monday"
    case tuesday = "tuesday"
    case wednesday = "wednesday"
    case thursday = "thursday"
    case friday = "friday"
    case saturday = "saturaday"
    case sunday = "sunday"
    case from = "from"
    case to = "to"
}

class BizHours:NSObject {
    var days:[Day] = []
    
    required init(json:[String:Any]) {
        if let monday = json[BizHoursFields.monday.rawValue] as? [String:Any]{
            if let from = monday[BizHoursFields.from.rawValue] as? String, let to = monday[BizHoursFields.to.rawValue] as? String {
                days.append(Day(day: BizHoursFields.monday.rawValue, from: from, to: to))
            }
        }
        if let tuesday = json[BizHoursFields.tuesday.rawValue] as? [String:Any]{
            if let from = tuesday[BizHoursFields.from.rawValue] as? String, let to = tuesday[BizHoursFields.to.rawValue] as? String {
                days.append(Day(day: BizHoursFields.tuesday.rawValue, from: from, to: to))
            }
        }
        if let wednesday = json[BizHoursFields.wednesday.rawValue] as? [String:Any]{
            if let from = wednesday[BizHoursFields.from.rawValue] as? String, let to = wednesday[BizHoursFields.to.rawValue] as? String {
                days.append(Day(day: BizHoursFields.wednesday.rawValue, from: from, to: to))
            }
        }
        if let thursday = json[BizHoursFields.thursday.rawValue] as? [String:Any]{
            if let from = thursday[BizHoursFields.from.rawValue] as? String, let to = thursday[BizHoursFields.to.rawValue] as? String {
                days.append(Day(day: BizHoursFields.thursday.rawValue, from: from, to: to))
            }
        }
        if let friday = json[BizHoursFields.friday.rawValue] as? [String:Any]{
            if let from = friday[BizHoursFields.from.rawValue] as? String, let to = friday[BizHoursFields.to.rawValue] as? String {
                days.append(Day(day: BizHoursFields.friday.rawValue, from: from, to: to))
            }
        }
        if let saturday = json[BizHoursFields.saturday.rawValue] as? [String:Any]{
            if let from = saturday[BizHoursFields.from.rawValue] as? String, let to = saturday[BizHoursFields.to.rawValue] as? String {
                days.append(Day(day: BizHoursFields.saturday.rawValue, from: from, to: to))
            }
        }
        if let sunday = json[BizHoursFields.sunday.rawValue] as? [String:Any]{
            if let from = sunday[BizHoursFields.from.rawValue] as? String, let to = sunday[BizHoursFields.to.rawValue] as? String {
                days.append(Day(day: BizHoursFields.sunday.rawValue, from: from, to: to))
            }
        }
    }
}

class Day:NSObject {
    var day:String
    var from:String
    var to:String
    init(day:String, from:String, to:String) {
        self.day = day
        self.from = from
        self.to = to
    }
}
