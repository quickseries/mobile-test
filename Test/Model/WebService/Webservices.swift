//
//  Webservices.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import Foundation

class Webservices {

    static func loadCategoryData(completionHandler: @escaping ([Category]?, Bool?) -> Void) {
        Network.loadRequest(requestURL: Webservices.categoryDataURL, type: [Category].self) { (categories, error) in
            guard error == nil else {
                completionHandler(nil, false)
                return
            }
            completionHandler(categories, true)
        }
    }
    
    static func loadRestaurantData(completionHandler: @escaping ([Resource]?, Bool?) -> Void) {
        Network.loadRequest(requestURL: Webservices.restaurantDataURL, type: [Resource].self) { (resources, error) in
            guard error == nil else {
                completionHandler(nil, false)
                return
            }
            completionHandler(resources, true)
        }
    }

    static func loadVacationSpotData(completionHandler: @escaping ([Resource]?, Bool?) -> Void) {
        Network.loadRequest(requestURL: Webservices.vacationDataURL, type: [Resource].self) { (resources, error) in
            guard error == nil else {
                completionHandler(nil, false)
                return
            }
            completionHandler(resources, true)
        }
    }

}

extension Webservices {
    
    private static func webServiceURL(method: Constants.Method) -> URL {
        
        let endPoint = method.rawValue
        let components = URLComponents(string: Constants.baseURLString + endPoint)!
        return components.url!
    }
    
    static var categoryDataURL: URL {
        return webServiceURL(method: .categories)
    }
    
    static var restaurantDataURL: URL {
        return webServiceURL(method: .restaurant)
    }
    
    static var vacationDataURL: URL {
        return webServiceURL(method: .vacation)
    }

}
