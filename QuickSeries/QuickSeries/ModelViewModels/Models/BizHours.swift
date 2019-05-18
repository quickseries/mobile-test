//
//  BizHours.swift
//  QuickSeries
//
//  Created by Engineer 144 on 18/05/2019.
//

import Foundation
struct BizHours: Codable {
    let sunday: Nday
    let monday: Nday
    let tueday: Nday
    let wednesday: Nday
    let thursday: Nday
    let friday: Nday
    let saturday: Nday
    
    enum CodingKeys: String, CodingKey {
        case sunday = "sunday"
        case monday = "monday"
        case tueday = "tueday"
        case wednesday = "wednesday"
        case thursday = "thursday"
        case friday = "friday"
        case saturday = "saturday"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sunday = try values.decodeIfPresent(Nday.self, forKey: .sunday) ?? Nday(from: "",to: "")
        monday = try values.decodeIfPresent(Nday.self, forKey: .monday) ?? Nday(from: "",to: "")
        tueday = try values.decodeIfPresent(Nday.self, forKey: .tueday) ?? Nday(from: "",to: "")
        wednesday = try values.decodeIfPresent(Nday.self, forKey: .wednesday) ?? Nday(from: "",to: "")
        thursday = try values.decodeIfPresent(Nday.self, forKey: .thursday) ?? Nday(from: "",to: "")
        friday = try values.decodeIfPresent(Nday.self, forKey: .friday) ?? Nday(from: "",to: "")
        saturday = try values.decodeIfPresent(Nday.self, forKey: .saturday) ?? Nday(from: "",to: "")
    }
    
    
    
}

struct Nday: Codable {
    let from: String
    let to: String
    
    init(from: String ,to: String) {
        self.from = from
        self.to = to
    }
    
    enum CodingKeys: String, CodingKey {
        case from = "from"
        case to = "to"
    }
}
