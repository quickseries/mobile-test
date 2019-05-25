//
//  APIService.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation
import Moya

enum APIService: TargetType {
    case categories
    case restaurants
    case vacationSpot
}

// MARK: - TargetType Protocol Implementation
extension APIService {
    
    var baseURL: URL { return URL(string: Constant.URLS.baseURL)! }
    
    var path: String {
        switch self {
        case .categories: return Constant.JSONS.categories
        case .restaurants: return Constant.JSONS.restaurants
        case .vacationSpot: return Constant.JSONS.vacationSpot
        }
    }
    var method: Moya.Method {
        switch self {
        case .categories, .restaurants, .vacationSpot:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .categories, .restaurants, .vacationSpot: // Send no parameters
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .categories:
            let url = Bundle.main.url(forResource: Constant.JSONS.categories, withExtension: Constant.DataType.json)!
            return try! Data(contentsOf: url)
        case .restaurants:
            let url = Bundle.main.url(forResource: Constant.JSONS.restaurants, withExtension: Constant.DataType.json)!
            return try! Data(contentsOf: url)
        case .vacationSpot:
            let url = Bundle.main.url(forResource: Constant.JSONS.vacationSpot, withExtension: Constant.DataType.json)!
            return try! Data(contentsOf: url)
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

