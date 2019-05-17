//
//  Address.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

struct Address: Codable  {
    
    let address: String
    let label: String
    let zipCode: String
    let city: String
    let state: String
    let country: String
    let coordinates: Coordinates?
    
    enum CodingKeys: String, CodingKey {
        case address = "address1"
        case label = "label"
        case zipCode = "zipCode"
        case city = "city"
        case state = "state"
        case country = "country"
        case coordinates = "gps"
    }
}
