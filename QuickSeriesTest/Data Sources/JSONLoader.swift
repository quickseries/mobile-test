//
//  JSONLoader.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-19.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import Foundation

enum DataFile: String {
    case categoriesFile = "categories"
    case vacationSpotFile = "vacation-spot"
    case restaurantsFile = "restaurants"
    
    var filename: String {
        return self.rawValue
    }
}

class JSONLoader {
    static func readJson(fromFile dataFile: DataFile) -> [[String: AnyObject]]? {
        let filename = dataFile.filename
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data)
                if let jsonResult = jsonResult as? [[String: AnyObject]] {
                    return jsonResult
                }
            } catch let jsonError {
                print("JSONLoader raised the following error: \(jsonError.localizedDescription)")
            }
        }
        return nil
    }
}

