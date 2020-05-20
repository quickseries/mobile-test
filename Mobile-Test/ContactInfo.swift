//
//  ContactInfo.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation

struct ContactInfo: Codable {
    let website: [URL]?
    let email: [String]?
    let phoneNumber: [String]?
    let faxNumber: [String]?
    let tollFree: [String]?
}
