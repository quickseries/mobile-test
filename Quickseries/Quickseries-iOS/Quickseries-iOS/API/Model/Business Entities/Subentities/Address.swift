//
//  Address.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct Address: Codable  {
    
    public let address: String
    public let label: String
    public let zipCode: String
    public let city: String
    public let state: String
    public let country: String
    public let coordinates: Coordinates?
    
    private enum CodingKeys: String, CodingKey {
        case address = "address1"
        case label = "label"
        case zipCode = "zipCode"
        case city = "city"
        case state = "state"
        case country = "country"
        case coordinates = "gps"
    }
}
