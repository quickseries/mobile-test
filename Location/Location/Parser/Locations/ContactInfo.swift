//
//  ContactInfo.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation

enum ContactType {
    case website
    case email
    case phoneNumber
    case faxNumber
    case tollFree
    
    func contactTitle() -> String {
        
        switch self {
        case .email: return "Email"
        case .website: return "website"
        case .phoneNumber: return "phoneNumber"
        case .faxNumber: return "faxNumber"
        case .tollFree: return "tollFree"
        }
    }
}

struct Contact {
    let contactType: ContactType
    let contact : String
}

struct ContactInfo : Codable {
    let website : [String]?
    let email : [String]?
    let faxNumber : [String]?
    let tollFree : [String]?
    let phoneNumber : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case website = "website"
        case email = "email"
        case faxNumber = "faxNumber"
        case tollFree = "tollFree"
        case phoneNumber = "phoneNumber"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        website = try values.decodeIfPresent([String].self, forKey: .website)
        email = try values.decodeIfPresent([String].self, forKey: .email)
        faxNumber = try values.decodeIfPresent([String].self, forKey: .faxNumber)
        tollFree = try values.decodeIfPresent([String].self, forKey: .tollFree)
        phoneNumber = try values.decodeIfPresent([String].self, forKey: .phoneNumber)
    }
    
    
    func contactCount() -> Int {
        var count = 0
        count = (website?.count ?? 0) + (email?.count ?? 0)
        count += (phoneNumber?.count ?? 0) + (faxNumber?.count ?? 0)
        count += (tollFree?.count ?? 0)
        return count
    }
    
    func contactsDetails() -> [Contact] {
        
        var contact = [Contact]()
        
        for data in website ?? [] {
            let webisit =  Contact(contactType: .website, contact: data)
            contact.append(webisit)
        }
        
        for data in email  ?? []{
            let email =  Contact(contactType: .email, contact: data)
            contact.append(email)
        }
        
        for data in phoneNumber ?? [] {
            let phoneNumber =  Contact(contactType: .phoneNumber, contact: data)
            contact.append(phoneNumber)
        }
        
        for data in faxNumber ?? [] {
            let faxNumber =  Contact(contactType: .faxNumber, contact: data)
            contact.append(faxNumber)
        }
        
        for data in tollFree ?? [] {
            let tollFree =  Contact(contactType: .tollFree, contact: data)
            contact.append(tollFree)
        }
        
        return contact
    }
}
