//
//  Address.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-15.
//  Copyright © 2020 Israel Romero. All rights reserved.
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
