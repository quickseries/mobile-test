//
//  ContactInfo.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-15.
//  Copyright © 2020 Israel Romero. All rights reserved.
//

import Foundation

struct ContactInfo: Codable {
    let website: [URL]?
    let email: [String]?
    let phoneNumber: [String]?
    let faxNumber: [String]?
    let tollFree: [String]?
}
