//
//  ApiUrlConstants.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

struct ApiUrlConstants {
    
    private static let baseUrl = "https://raw.githubusercontent.com/alipishvaee/mobile-test/master/data"
    
    struct CategoryList {
        private static let categoryListEndPoint = "/categories.json"
        static let url = baseUrl + categoryListEndPoint
    }
    
    struct ResourceList {
        private static let restaurantListEndPoint = "/restaurants.json"
        private static let vacationSpotListEndPoint = "/vacation-spot.json"
        
        static func url(for type: CategoryType) -> String {
            switch type {
            case .restaurant:
                return baseUrl + ApiUrlConstants.ResourceList.restaurantListEndPoint
            case .vacationSpots:
                return baseUrl + ApiUrlConstants.ResourceList.vacationSpotListEndPoint
            }
        }
    }
    
}
