//
//  RestaurantsJSONParser.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RestaurantsJSONParser {
  static func getRecources(forType type: String) -> [Restaurant?] {
    var restaurants: [Restaurant] = []
    
    guard let fileURL = Bundle.main.url(forResource: type, withExtension: "json") else { return restaurants }
    guard let localJSONData = try? Data(contentsOf: fileURL) else { return restaurants }
    
    let json = JSON(data: localJSONData)
    
    for entry in json.arrayValue {
      let title = entry["title"].string
      let description = entry["description"].string?.replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: "")
      let photo = entry["photo"].string
      let address = HelperJSONParser.getAddress(forJSON: entry)
      let contactInfo = HelperJSONParser.getContactInfo(forJSON: entry)
      let socialMedies = HelperJSONParser.getSocialMedias(forJSON: entry)

      let restaurant = Restaurant(title: title, description: description, photo: photo, address: address, contactInfo: contactInfo, socialMedia: socialMedies)
      
      restaurants.append(restaurant)
    }
    
    return restaurants
  }
}
