//
//  ContactInfo.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import Foundation

struct ContactInfo {
  var webSite: String?
  var email: String?
  var faxNumber: String?
  var phoneNumber: String?
  var tollFree: String?
  
  var allValidProperties = [String]()

  init (webSite: String?, email: String?, faxNumber: String?, phoneNumber: String?, tollFree: String?) {
    self.webSite = webSite
    self.email = email
    self.faxNumber = faxNumber
    self.phoneNumber = phoneNumber
    self.tollFree = tollFree

    if let website = webSite {
      allValidProperties.append(website)
    }
    
    if let email = email {
      allValidProperties.append(email)
    }
    
    if let faxNumber = faxNumber {
      allValidProperties.append(faxNumber)
    }
    
    if let phoneNumber = phoneNumber {
      allValidProperties.append(phoneNumber)
    }
    
    if let tollFree = tollFree {
      allValidProperties.append(tollFree)
    }
  }
}
