//
//  Addresses.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-20.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import Foundation

struct Addresses: Decodable {

    var address: String?
    var label: String?
    var zipCode: String?
    var city: String?
    var state: String?
    var country: String?
    var gps: [String: String]?

    enum CodingKeys: String, CodingKey {
        case address = "address1"
        case label
        case zipCode
        case city
        case state
        case country
        case gps
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decodeIfPresent(String.self, forKey: .address)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.gps = try container.decodeIfPresent(Dictionary.self, forKey: .gps)
    }
}
