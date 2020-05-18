//
//  Common.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

// MARK: - Address
struct Address: Codable {
    let address1, label, zipCode, city: String
    let state, country: String
    let gps: Gps?
}

// MARK: - Gps
struct Gps: Codable {
    let latitude, longitude: String
}

// MARK: - BizHours
struct BizHours: Codable {
    let sunday, monday: Nday
}

// MARK: - Nday
struct Nday: Codable {
    let from, to: String
}

// MARK: - ContactInfo
struct ContactInfo: Codable {
    let website: [String]?
    let email: [String]?
    let phoneNumber: [String]
    let faxNumber, tollFree: [String]?
}

// MARK: - SocialMedia
struct SocialMedia: Codable {
    let youtubeChannel, twitter, facebook: [String]
}
