//
//  Constants.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

enum Constants {
    enum API {
        static let contentTypeKey = "Content-Type"
        static let contentTypeJSON = "application/json"
        
        static let httpMethodPost = "POST"
        static let baseURL = "https://raw.githubusercontent.com/"//"https://github.com"
        static let standardPath = "/vlkden/mobile-test/master/data/"
        
        static let categoryPath = "categories.json"
        static let restaurantsPath = "restaurants.json"
        static let vacationSpotPath = "vacation-spot.json"
    }
    
    enum Error {
        static let apiDomain = "APIHelper"
        static let defaultErrorCode = 400
    }
    
    enum JSONFileName {
        static let categories = "categoties"
        static let restaurants = "restaurants"
        static let vacationSpot = "vacation-spot"
    }
    
    enum DateFormats {
        static let main = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    }
}
