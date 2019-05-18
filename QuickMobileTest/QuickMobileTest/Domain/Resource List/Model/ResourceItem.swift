//
//  ResourceItem.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

struct ResourceItem {
    let title: String
    let description: String
    let isActive: Bool
    let sectionTypes: [SectionItemType]
}

enum SectionItemType {
    case photo(String),
    resourceDetail(String?, String?),
    contact([ContactInfo]),
    address([ResourceAddress]),
    socialMedia([SocailMedia]),
    bizHours([BizHour])
}

struct ContactInfo {
    let contact: String
    let type: ContactType
}

enum ContactType {
    case phoneNumber, email, website, tollFree, faxNumber
}

struct ResourceAddress {
    let completeAddress: String
    let gps : LatLng?
}

struct LatLng {
    let latitude: Double
    let longitude: Double
}

struct SocailMedia {
    let link: String
    let type: SocailMediaType
}

enum SocailMediaType {
    case youtube, twitter, facebook
}

struct BizHour {
    let day: BizHourDay
    let duration: String
}

enum BizHourDay {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}
