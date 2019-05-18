//
//  ResourceResponse.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

struct ResourceResponse : Codable {
    let _id: String = ""
    let slug: String?
    let eid: String?
    let title: String?
    let description: String?
    let category_eid: String?
    let __v: Int = 0
    let photo: String?
    let _active: Bool = false
    let updated_at: String?
    let created_at: String?
    let addresses: [AddressResponse]?
    let contactInfo: ContactInfoResponse?
    let bizHours: BizHourResponse?
    let socialMedia: SocialMediaResponse?
}

struct ContactInfoResponse : Codable {
    let website: [String]?
    let email: [String]?
    let phoneNumber: [String]?
    let tollFree: [String]?
    let faxNumber: [String]?
}

struct BizHourResponse: Codable {
    let sunday: Day?
    let monday: Day?
    let tuesday: Day?
    let wednesday: Day?
    let thursday: Day?
    let friday: Day?
    let saturday: Day?
}

struct Day: Codable {
    let from: String?
    let to: String?
}

struct SocialMediaResponse: Codable {
    let youtubeChannel: [String]?
    let twitter: [String]?
    let facebook: [String]?
}
