//
//  Restaurant.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import Foundation

struct Restaurant {
  var title: String?
  var description: String?
  var photo: String?
  var address: [Address?]
  var contactInfo: ContactInfo?
  var socialMedia: SocialMedia?
  var bizHours: BussinessHours?
  
  var sections = 0
  
  var allValidProperties = [[String]]()

  init (title: String?, description: String?, photo: String?, address: [Address?], contactInfo: ContactInfo?, socialMedia: SocialMedia?) {
    
    self.title = title
    self.description = description
    self.photo = photo
    self.address = address
    self.contactInfo = contactInfo
    self.socialMedia = socialMedia
    
    sections += 1
    allValidProperties.append([title!, description!])
    if let contactInfo = contactInfo, !contactInfo.allValidProperties.isEmpty {
      sections += 1
      allValidProperties.append(contactInfo.allValidProperties)
    }
    
    if let socialMedia = socialMedia, !socialMedia.allValidProperties.isEmpty {
      sections += 1
      allValidProperties.append(socialMedia.allValidProperties)

    }
    
    for address in address {
      if let address = address, !address.allValidProperties.isEmpty {
        sections += 1
        allValidProperties.append(address.allValidProperties)

        return
      }
    }
  }
}
