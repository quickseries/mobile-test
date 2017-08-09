//
//  VacationSpotJSONParser.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct VacationSpotJSONParser {
  static func getVacationSpot() -> [VacationSpot?] {
    var vacationSpots: [VacationSpot?] = []
    
    guard let fileURL = Bundle.main.url(forResource:"vacation-spot", withExtension: "json") else { return vacationSpots }
    guard let localJSONData = try? Data(contentsOf: fileURL) else { return vacationSpots }
    
    let json = JSON(data: localJSONData)
    
    for entry in json.arrayValue {
      
      let title = entry["title"].string
      let description = entry["description"].string?.replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: "")
      let photo = entry["photo"].string
      let address = HelperJSONParser.getAddress(forJSON: entry)
      let contactInfo = HelperJSONParser.getContactInfo(forJSON: entry)
      let socialMedies = HelperJSONParser.getSocialMedias(forJSON: entry)
      
      let vacationSpot = VacationSpot(title: title, description: description, photo: photo, address: address, contactInfo: contactInfo, bizHours: nil, socialMedia: socialMedies)
      
      vacationSpots.append(vacationSpot)
    }
    
    return vacationSpots
  }
}
