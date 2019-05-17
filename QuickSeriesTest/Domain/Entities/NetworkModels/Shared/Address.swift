//
//  Address.swift
//  Domain
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

public struct Adress: Codable {
  public let address: String
  public let label: String
  public let zipCode: String
  public let city: String
  public let state: String
  public let country: String
  public let locationCoordinate: Coordinate
  
  private enum CodingKeys : String, CodingKey {
    case address = "address1", label, zipCode, city, state, country, locationCoordinate = "gps"
  }
}
