//
//  Quickseries.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import Moya

enum Quickseries {
    case getCategories
    case getRestaurants
    case getVacationSpots
}

extension Quickseries : TargetType {
    
    var baseURL: URL {
        return URL(string: "https://raw.githubusercontent.com/emisvx/mobile-test/master/data")!
    }
    
    var path: String {
        switch self {
        case .getCategories: return "/categories.json"
        case .getRestaurants: return "/restaurants.json"
        case .getVacationSpots: return "/vacation-spot.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data(base64Encoded: "")!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
