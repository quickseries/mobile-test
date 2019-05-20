//
//  RestaurantsDatasource.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Foundation
import Moya

enum RestaurantsApi {
    case vacationSpots
}

extension RestaurantsApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://myserver.com")!
    }
    
    var path: String {
        return "/restaurants/" + "v1"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        let url = Bundle.main.url(forResource: "restaurants", withExtension: "json")!.deletingLastPathComponent()
        let mockJSONFileURL = url.appendingPathComponent("restaurants.json")
        return try! Data(contentsOf: mockJSONFileURL)
    }
    
    var task: Task {
        return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
