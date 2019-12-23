//
//  Constants.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

struct Constants {
  
    static let baseURLString = "https://raw.githubusercontent.com/hardik38737/mobile-test/master/data/"
    
    enum Method : String {
        case categories = "categories.json"
        case restaurant = "restaurants.json"
        case vacation = "vacation-spot.json"
    }
    
    //
    // MARK: - Date Formatters
    //
    struct DateFormatters {
        static let simpleDateFormatter: DateFormatter = {
            var dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "EDT")
            return dateFormatter
        }()
    }
}

enum DetailPageType: String {

    case contactInfo = "CONTACT INFORMATION"
    case address = "ADDRESS"
    case socialMedia = "SOCIAL MEDIA"
    case businessHours = "BUSINESS HOURS"

}

enum Contact: String {

    case email = "EMAIL ADDRESS"
    case website = "WEBSITE"
    case faxNumber = "FAX NUMBER"
    case tollFreeNumber = "TOLL-FREE NUMBER"
    case phoneNumber = "PHONE NUMBER"
}

