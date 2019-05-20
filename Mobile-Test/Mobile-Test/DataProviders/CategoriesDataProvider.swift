//
//  CategoriesDataProvider.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Foundation
import Moya

enum CategoryApi {
    case category
}

extension CategoryApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://myserver.com")!
    }
    
    var path: String {
        return "/categories/" + "v1"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        let url = Bundle.main.url(forResource: "categories", withExtension: "json")!.deletingLastPathComponent()
        let mockJSONFileURL = url.appendingPathComponent("categories.json")
        return try! Data(contentsOf: mockJSONFileURL)
    }
    
    var task: Task {
        return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
