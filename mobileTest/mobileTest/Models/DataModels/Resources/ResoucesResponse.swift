//
//  ResoucesResponse.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation

public struct ResoucesResponse: Codable {
  public let title: String
  public let description: String
  public let photo: URL
  public struct Addresse: Codable {
    public let address1: String
    public let label: String
    public let zipCode: String
    public let city: String
    public let state: String
    public let country: String
    public struct Gps: Codable {
      public let latitude: String
      public let longitude: String
    }
    public let gps: Gps?
  }
  public let addresses: [Addresse]?
  public struct ContactInfo: Codable {
    public let website: [URL]?
    public let email: [String]?
    public let phoneNumber: [String]
  }
  public let contactInfo: ContactInfo?
  public struct BizHours: Codable {
    public struct Sunday: Codable {
      public let from: String
      public let to: String
    }
    public let sunday: Sunday
    public struct Monday: Codable {
      public let from: String
      public let to: String
    }
    public let monday: Monday
  }
  public let bizHours: BizHours?
  public struct SocialMedia: Codable {
    public let youtubeChannel: [URL]
    public let twitter: [URL]
    public let facebook: [URL]
  }
  public let socialMedia: SocialMedia?
  private enum CodingKeys: String, CodingKey {
    case title
    case description
    case photo
    case addresses
    case contactInfo
    case bizHours
    case socialMedia
  }
}
