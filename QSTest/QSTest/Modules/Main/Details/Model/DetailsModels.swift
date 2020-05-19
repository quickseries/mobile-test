//
//  Models.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import UIKit

enum DetailsSection {
    case header(_ header: HeaderModelForUI)
    case contactInfo(_ title: String, items: [ContactInfoItemForUI])
    case note(_ note: String)
    case socialMedia(_ items: [SocialMedia])
    case buisnessHours([BuisnessDayForUI])
}

struct ContactInfoItemForUI {
    let title: String
    let subTitle: String
    let iconNames: [String]
}

struct BuisnessDayForUI {
    let title: String
    let rangeString: String
}

struct SocialMediaForUI {
    enum MediaType: String {
        case youtubeChannel, twitter, facebook
    }
    let type: MediaType
    let urlString: String
}

struct HeaderModelForUI {
    let title: String
    let description: String
}
