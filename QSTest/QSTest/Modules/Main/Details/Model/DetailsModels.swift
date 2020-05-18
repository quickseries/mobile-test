//
//  Models.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

enum DetailsSection {
    case header(_ header: HeaderModelForUI)
    case contactInfo(_ title: String, items: [ContactInfoItemForUI])
}

struct ContactInfoItemForUI {
    enum ContactType {
        case phone, website, fax, tollFree, email
    }
    
    let title: String
    let subTitle: String
}

enum ContactInfoForUI {
    case website(String)
//    case 
}

struct HeaderModelForUI {
    let title: String
    let description: String
}
