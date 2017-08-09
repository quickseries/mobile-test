//
//  CategoriesJSONParser.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CategoriesJSONParser {
  static func getCategories() -> [Category?] {
    var categories: [Category] = []
    
    
    guard let fileURL = Bundle.main.url(forResource:"categories", withExtension: "json") else { return categories }
    guard let localJSONData = try? Data(contentsOf: fileURL) else { return categories }
    
    let json = JSON(data: localJSONData)
    
    for entry in json.arrayValue {
      let title = entry["title"].string
      let description = entry["description"].string
      
      let category = Category(title: title, description: description)
      categories.append(category)
    }
    
    return categories
  }
}
