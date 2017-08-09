//
//  HelperJSONParser.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct HelperJSONParser {
  static func getAddress(forJSON json: JSON) -> [Address] {
    var addresses = [Address]()
    
    for address in json["addresses"].arrayValue {
      let address1 = address["address1"].string
      let label = address["label"].string
      let zipCode = address["zipCode"].string
      let city = address["city"].string
      let state = address["state"].string
      let country = address["country"].string
      let latitude = address["gps"]["latitude"].string
      let longitude = address["gps"]["longitude"].string
      
      let address = Address(address1: address1, label: label, zipCode: zipCode, city: city, state: state, country: country, latitude: latitude, longitude: longitude)
      
      addresses.append(address)
    }
    
    return addresses
  }
  
  static func getContactInfo(forJSON json: JSON) -> ContactInfo {
    
    let webSite = json["contactInfo"]["website"][0].string
    let email = json["contactInfo"]["email"][0].string
    let faxNumber = json["contactInfo"]["faxNumber"][0].string
    let phoneNumber = json["contactInfo"]["phoneNumber"][0].string
    let tollFree = json["contactInfo"]["tollFree"][0].string
        
    return ContactInfo(webSite: webSite, email: email, faxNumber: faxNumber, phoneNumber: phoneNumber, tollFree: tollFree)
  }
  
  static func getSocialMedias(forJSON json: JSON) -> SocialMedia {
    
    let youtubeChannel = json["socialMedia"]["youtubeChannel"][0].string
    let twitter = json["socialMedia"]["twitter"][0].string
    let facebook = json["socialMedia"]["facebook"][0].string
    
    return SocialMedia(youtubeChannel: youtubeChannel, twitter: twitter, facebook: facebook)
  }
  
//  static func getBussinessHours(forJSON json: JSON) -> SocialMedia {
//    
//    let sundayFrom = json["bizHours"]["sunday"]["from"].string
//    let sundayTo = json["bizHours"]["sunday"]["to"].string
//
//    let twitter = json["twitter"].string
//    let facebook = json["facebook"].string
//    
//    return SocialMedia(youtubeChannel: youtubeChannel, twitter: twitter, facebook: facebook)
//  }

}
