//
//  Resource.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import Foundation

struct Resource: Decodable {
    let title: String
    let description: String
    let photo: String
    let addresses: [Address]?
    let contactInfo: ContactInfo
    let socialMedia: SocialMedia?
    let bizHours: BizHours?
    let freeText: [Note?]?
}

struct Address: Decodable {
    let address1: String?
    let label: String?
    let zipCode: String?
    let city: String?
    let state: String?
    let country: String?
    let gps: GPS?
}

struct GPS: Decodable {
    let latitude: String
    let longitude: String
}

struct ContactInfo: Decodable {
    let website: [String]?
    let email: [String]?
    let faxNumber: [String]?
    let tollFree: [String]?
    let phoneNumber: [String]?
}

struct SocialMedia: Decodable {
    let youtubeChannel: [String]?
    let twitter: [String]?
    let facebook: [String]?
}

struct BizHours: Decodable {
    let sunday: DayOfWeek?
    let monday: DayOfWeek?
    let thursday: DayOfWeek?
    let wednesday: DayOfWeek?
    let stuesdayunday: DayOfWeek?
    let friday: DayOfWeek?
    let saturday: DayOfWeek?
}

struct DayOfWeek: Decodable {
    let from: String
    let to: String
}

struct Note: Decodable {
    
}




