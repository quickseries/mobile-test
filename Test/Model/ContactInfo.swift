//
//  ContactInfo.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-20.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import Foundation

struct ContactInfo: Decodable {
    
    var webSite: String?
    var email: String?
    var faxNumber: String?
    var tollFreeNumber: String?
    var phoneNumber: String?

    enum CodingKeys: String, CodingKey {
        case website = "website"
        case email = "email"
        case faxnumber = "faxNumber"
        case tollfreenumber = "tollFree"
        case phonenumber = "phoneNumber"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.webSite = try container.decodeIfPresent(String.self, forKey: .website)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.faxNumber = try container.decodeIfPresent(String.self, forKey: .faxnumber)
        self.tollFreeNumber = try container.decodeIfPresent(String.self, forKey: .tollfreenumber)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phonenumber)
    }
}
