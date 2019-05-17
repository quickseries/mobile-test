//
//  ContactInfo.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

struct ContactInfo: Codable {
    
    let website: String?
    let email: String?
    let faxNumber: String?
    let tollFree: String?
    let phoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case website = "website"
        case email = "email"
        case faxNumber = "faxNumber"
        case tollFree = "tollFree"
        case phoneNumber = "phoneNumber"
    }
}
