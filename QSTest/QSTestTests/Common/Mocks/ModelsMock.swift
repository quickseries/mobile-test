//
//  ModelsMock.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

extension QSTest.Category {
    static func mocked(slug: QSTest.Category.Slug? = nil) -> QSTest.Category {
        var newSlug: QSTest.Category.Slug = Bool.random() == true ? .restaurants : .vacationSpots
        
        if let slug = slug {
            newSlug = slug
        }
        
        return QSTest.Category(id: UUID().uuidString,
                               slug: newSlug,
                               customModuleEid: UUID().uuidString,
                               eid: UUID().uuidString,
                               title: newSlug.rawValue,
                               description: "\(newSlug.rawValue) description",
                               v: 0,
                               active: true,
                               created: Date(),
                               updated: Date())
    }
}

extension Restaurant {
    static var mocked: Restaurant {
        return Restaurant(id: UUID().uuidString,
                          slug: "",
                          eid: UUID().uuidString,
                          title: "",
                          restaurantDescription: "",
                          categoryEid: "",
                          v: 0, photo: "",
                          active: true,
                          updated: Date(),
                          created: Date(),
                          addresses: nil,
                          contactInfo: ContactInfo.mocked,
                          bizHours: nil,
                          socialMedia: nil)
    }
}

extension ContactInfo {
    static var mocked: ContactInfo {
        return ContactInfo(website: nil,
                           email: nil,
                           phoneNumber: ["555555555"],
                           faxNumber: nil,
                           tollFree: nil)
    }
}

extension VacationSpot {
    static var mocked: VacationSpot {
        let socialMedia = SocialMedia(youtubeChannel: [""], twitter: [""], facebook: [""])
        let address = Address(address1: nil, label: nil, zipCode: nil, city: nil, state: nil, country: nil, gps: nil)
        
        
        return VacationSpot(id: UUID().uuidString,
                            slug: "",
                            eid: UUID().uuidString,
                            photo: "",
                            title: "",
                            vacationSpotDescription: "",
                            categoryEid: UUID().uuidString,
                            active: true,
                            v: 0,
                            created: Date(),
                            updated: Date(),
                            socialMedia: socialMedia,
                            addresses: [address],
                            contactInfo: ContactInfo.mocked)
    }
}
