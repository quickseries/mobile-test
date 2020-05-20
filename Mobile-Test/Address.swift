//
//  Address.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation

struct GPSCoordinate: Codable {
    let latitude: String
    let longitude: String
}

struct Address: Codable {
    let address: String?
    let label: String?
    let zipCode: String?
    let city: String?
    let state: String?
    let country: String?
    let coordinates: GPSCoordinate?
    
    private enum CodingKeys: String, CodingKey {
        case address = "address1"
        case label
        case zipCode
        case city
        case state
        case country
        case coordinates = "gps"
    }
}
