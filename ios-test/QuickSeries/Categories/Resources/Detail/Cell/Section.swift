//  Section.swift
//  QuickSeries
//
//  Created by Franck Clement on 06/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

protocol Section {
    var title: String? { get }
    var rowCount: Int { get }
}

protocol ResourceSection: Section {
    var sectionType: ResourceSectionType { get }
}

enum ResourceSectionType {
    case header
    case contact
    case address
}

struct HeaderSection: ResourceSection {
    
    let title: String? = nil
    let sectionType: ResourceSectionType = .header
    let subtitle: String?
    let photoURL: URL
    var rowCount: Int = 1
}

struct ContactSection: ResourceSection {
    
    var sectionType: ResourceSectionType = .contact
    var title: String? = "Contact Information"
    var contacts: [TappableInformation]
    var rowCount: Int { contacts.count }
    
    init(contact: Contact) {
        contacts = [
            contact.phoneNumber?.compactMap { $0.isEmpty ? nil : TappableInformation(type: .phoneNumber, content: $0) },
            contact.tollFreeNumber?.compactMap { $0.isEmpty ? nil : TappableInformation(type: .tollFreeNumber, content: $0) },
            contact.email?.compactMap { $0.isEmpty ? nil : TappableInformation(type: .email, content: $0) },
            contact.website?.compactMap { TappableInformation(type: .website, content: $0.absoluteString) }
        ]
        .compactMap { $0 }
        .reduce([], +)
    }
}

struct AddressSection: ResourceSection {
    
    var sectionType: ResourceSectionType = .address
    var title: String? = "Address"
    var addresses: [TappableInformation] = []
    var rowCount: Int { addresses.count }
    
    init(addresses: [Address]) {
        self.addresses = addresses.map { addressInfo -> TappableInformation? in
            guard let address = addressInfo.address,
                let city = addressInfo.city,
                let zipCode = addressInfo.zipCode,
                let country = addressInfo.country,
                let location = addressInfo.location else { return nil }
            return TappableInformation(type: .address(location: location), content: String(address + ", " + zipCode + ", " + city + ", " + country))
        }.compactMap { $0 }
    }
}
