//
//  Addresses.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation

struct Addresses : Codable {
    let address1 : String?
    let label : String?
    let zipCode : String?
    let city : String?
    let state : String?
    let country : String?
    let gps : Gps?
    
    enum CodingKeys: String, CodingKey {
        
        case address1 = "address1"
        case label = "label"
        case zipCode = "zipCode"
        case city = "city"
        case state = "state"
        case country = "country"
        case gps = "gps"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address1 = try values.decodeIfPresent(String.self, forKey: .address1)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        zipCode = try values.decodeIfPresent(String.self, forKey: .zipCode)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        gps = try values.decodeIfPresent(Gps.self, forKey: .gps)
    }
    
}
