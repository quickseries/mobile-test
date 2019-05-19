//
//  ContactInfoModel.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import ObjectMapper

enum ContactInfoTypes: String
{
    case website = "website"
    case email = "email"
    case phoneNumber = "phoneNumber"
    case unknown = "unknown"
}

typealias ContactInfoModel = Dictionary<String,Array<String>>
