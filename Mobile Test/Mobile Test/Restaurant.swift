//
//  Restaurant.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import Foundation

enum RestaurantFields:String{
    case bizHours = "bizHours"
}


class Restaurant:VacationSpot {
    
    var bizHours:BizHours?

    required init(json:[String:Any]) {
        super.init(json: json)
        
        if let bizHoursDic = json[RestaurantFields.bizHours.rawValue] as? [String:Any]{
            self.bizHours = BizHours(json: bizHoursDic)
        }
    }
}




