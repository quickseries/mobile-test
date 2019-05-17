//
//  ResourceModel.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation

public struct ResourceModel {
  public let title: String
  public let description: String?
  public let image: URL?
  public let address: [Address]?
  public let contactInfo: ContactInfo?
  
  init(resourceData: ResoucesResponse) {
    self.title = resourceData.title
    self.description = resourceData.description
    self.image = resourceData.photo
    self.address = resourceData.addresses?.map { Address(address: $0) }
    self.contactInfo = resourceData.contactInfo.map { ContactInfo(contactInfo: $0) }
  }
}

public struct Address {
  public let formattedAddress: String
  public let location: (lat: Double, lng: Double)
  
  public init(address: ResoucesResponse.Addresse) {
    self.formattedAddress = [address.label, address.address1, address.city, address.state, address.country, address.zipCode].joined(separator: ", ")
    self.location = (lat: (address.gps?.latitude).flatMap { Double($0) } ?? 0.0, lng: (address.gps?.longitude).flatMap { Double($0) } ?? 0.0)
  }
}

public struct ContactInfo {
  public let websites: [URL]?
  public let phoneNumbers: [String]?
  public let emailIds: [String]?
  
  public init(contactInfo: ResoucesResponse.ContactInfo) {
    self.websites = contactInfo.website
    self.emailIds = contactInfo.email
    self.phoneNumbers = contactInfo.phoneNumber
  }
}
