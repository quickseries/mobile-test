//
//  ResourceAddress.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

struct AddressResponse : Codable {
    let address1: String?
    let label: String?
    let zipCode: String?
    let city: String?
    let state: String?
    let country: String?
    let gps: Gps?
}

struct Gps: Codable {
    let latitude: String?
    let longitude: String?
}
