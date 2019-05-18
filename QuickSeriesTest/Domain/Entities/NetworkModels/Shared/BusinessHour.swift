//
//  BusinessHour.swift
//  Domain
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

public struct BusinessWeek: Codable {
  public let saturday: BusinessHour?
  public let sunday: BusinessHour?
  public let monday: BusinessHour?
  public let tuesday: BusinessHour?
  public let wednesday: BusinessHour?
  public let thursday: BusinessHour?
  public let friday: BusinessHour?
  
  public init() {
    let closed = "CLOSED"
    self.saturday = BusinessHour(from: closed, to: closed)
    self.sunday = BusinessHour(from: closed, to: closed)
    self.monday = BusinessHour(from: closed, to: closed)
    self.tuesday = BusinessHour(from: closed, to: closed)
    self.wednesday = BusinessHour(from: closed, to: closed)
    self.thursday = BusinessHour(from: closed, to: closed)
    self.friday = BusinessHour(from: closed, to: closed)
  }
}
public struct BusinessHour: Codable {
  public let from: String
  public let to: String
}
