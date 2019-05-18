//
//  CategoryResource.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public protocol CategoryResource: Resource {
    var photo: String { get }
    var addresses: [Address] { get }
    var contactInfo: ContactInfo { get }
    var socialMedia: SocialMedia { get }
    var description: String { get }
}
