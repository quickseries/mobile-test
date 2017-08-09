//
//  Address.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import Foundation

struct Address {
  var address1: String?
  var label: String?
  var zipCode: String?
  var city: String?
  var state: String?
  var country: String?
  var latitude: String?
  var longitude: String?
  
  var allValidProperties = [String]()
  
  init(address1: String?, label: String?, zipCode: String?, city: String?, state: String?, country: String?, latitude: String?, longitude: String?) {
    self.address1 = address1
    self.label = label
    self.zipCode = zipCode
    self.city = city
    self.state = address1
    self.country = country
    self.latitude = latitude
    self.longitude = longitude

    if let address1 = address1 {
      allValidProperties.append(address1)
    }
    
    if let label = label {
      allValidProperties.append(label)
    }
    
    if let zipCode = zipCode {
      allValidProperties.append(zipCode)
    }
    
    if let city = city {
      allValidProperties.append(city)
    }
    
    if let state = state {
      allValidProperties.append(state)
    }
    
    if let country = country {
      allValidProperties.append(country)
    }
    
    if let latitude = latitude {
      allValidProperties.append(latitude)
    }
    
    if let longitude = longitude {
      allValidProperties.append(longitude)
    }
  }
}
