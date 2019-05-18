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
    
}
