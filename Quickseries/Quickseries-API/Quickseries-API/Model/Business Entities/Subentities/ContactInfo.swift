//
//  ContactInfo.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct ContactInfo: Codable {
    
    public let website: String?
    public let email: String?
    public let faxNumber: String?
    public let tollFree: String?
    public let phoneNumber: String?
    
    private enum CodingKeys: String, CodingKey {
        case website = "website"
        case email = "email"
        case faxNumber = "faxNumber"
        case tollFree = "tollFree"
        case phoneNumber = "phoneNumber"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        website = try container.decode([String].self, forKey: CodingKeys.website).first?.nilIfEmpty
        email = try container.decode([String].self, forKey: CodingKeys.email).first?.nilIfEmpty
        faxNumber = try container.decode([String].self, forKey: CodingKeys.faxNumber).first?.nilIfEmpty
        tollFree = try container.decode([String].self, forKey: CodingKeys.tollFree).first?.nilIfEmpty
        phoneNumber = try container.decode([String].self, forKey: CodingKeys.phoneNumber).first?.nilIfEmpty
    }
}
