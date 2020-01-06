//  Resource.swift
//  QuickSeries
//
//  Created by Franck Clement on 03/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import Foundation

/// A Resource is part of the model layer.
/// It contains detail about a particular item from a given CategoryType
class Resource: Decodable {
    
    let id: String
    let title: String
    let subtitle: String?
    let photoURL: URL
    let addresses: [Address]?
    let socialMedias: SocialMedia?
    let businessHour: BusinessHour?
    let contact: Contact?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case subtitle = "description"
        case photoURL = "photo"
        case addresses
        case socialMedias
        case businessHour = "bizHours"
        case contact = "contactInfo"
    }
}

/// The Address details about a Resource
struct Address: Decodable {
    
    let address: String?
    let name: String?
    let zipCode: String?
    let city: String?
    let state: String?
    let country: String?
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case address = "address1"
        case name = "label"
        case zipCode
        case city
        case state
        case country
        case location = "gps"
    }
}

/// The Contact details about a Resource
struct Contact: Decodable {
    
    let website: [URL]?
    let email: [String]?
    let faxNumber: [String]?
    let tollFreeNumber: [String]?
    let phoneNumber: [String]?
    
    enum CodingKeys: String, CodingKey {
        case website
        case email
        case faxNumber
        case tollFreeNumber = "tollFree"
        case phoneNumber
    }
}

/// The Location of a Resource
struct Location: Decodable {
    let latitude: String
    let longitude: String
}

/// The social media information about a Resource
struct SocialMedia: Decodable {
    let youtube: [String]
    let twitter: [String]
    let facebook: [String]
    
    enum CodingKeys: String, CodingKey {
        case youtube = "youtubeChannel"
        case twitter
        case facebook
    }
}

/// The hours of the week the Resource is open
struct BusinessHour: Decodable {
    let monday: [String: String]?
    let tuesday: [String: String]?
    let wednesday: [String: String]?
    let thursday: [String: String]?
    let friday: [String: String]?
    let saturday: [String: String]?
    let sunday: [String: String]?
}

// MARK: Comparable conformance

extension Resource: Comparable {
    
    static func ==(lhs: Resource, rhs: Resource) -> Bool {
        return lhs.title == rhs.title
    }
    
    static func <(lhs: Resource, rhs: Resource) -> Bool {
        return lhs.title < rhs.title
    }
}
