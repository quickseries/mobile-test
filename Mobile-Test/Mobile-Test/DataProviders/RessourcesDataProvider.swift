//
//  RessourceDataProvider.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Foundation
import Moya

enum RessourceApi {
    case vacationSpots
    case restaurants
}

extension RessourceApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://myserver.com")!
    }
    
    var path: String {
        switch self {
        case .restaurants:
            return "/restaurants/" + "v1"
        case .vacationSpots:
            return "/vacation-spots/" + "v1"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .restaurants:
            let url = Bundle.main.url(forResource: "restaurants", withExtension: "json")!.deletingLastPathComponent()
            let mockJSONFileURL = url.appendingPathComponent("restaurants.json")
            return try! Data(contentsOf: mockJSONFileURL)
        case .vacationSpots:
            let url = Bundle.main.url(forResource: "vacation-spot", withExtension: "json")!.deletingLastPathComponent()
            let mockJSONFileURL = url.appendingPathComponent("vacation-spot.json")
            return try! Data(contentsOf: mockJSONFileURL)
        }
    }
    
    var task: Task {
        return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
