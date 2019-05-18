//
//  ContactInfo.swift
//  Domain
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

public struct ContactInfo: Codable {
  public let website: [String]?
  public let email: [String]?
  public let phoneNumber: [String]?
  public let faxNumber: [String]?
  public let tollFree: [String]?
}



