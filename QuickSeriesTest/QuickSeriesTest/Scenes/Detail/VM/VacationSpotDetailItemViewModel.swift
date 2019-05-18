//
//  VacationSpotDetailItemViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-19.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import Domain

final class VacationSpotDetailItemViewModel {
  var title: String
  var description: NSAttributedString
  var addresses: [Adress]
  var response: VacationSpotItemViewModel
  var businessHours: [BusinessWeekItem]
  
  init (with response: VacationSpotItemViewModel) {
    self.response = response
    self.title = response.title
    self.description = response.description.htmlAttributed(family: "Montserrat-Medium", size: 12) ?? NSAttributedString.init(string: "")
    self.addresses = response.response.addresses ?? [Adress]()
    let businessWeek = response.response.businessHours ?? BusinessWeek()
    let businessWeekItems = [
      BusinessWeekItem(title: BusinessWeekType.sunday.rawValue, content: "\(businessWeek.sunday?.from ?? "") - \(businessWeek.sunday?.to ?? "")"),
      BusinessWeekItem(title: BusinessWeekType.monday.rawValue, content: "\(businessWeek.monday?.from ?? "") - \(businessWeek.monday?.to ?? "")"),
      BusinessWeekItem(title: BusinessWeekType.tuesday.rawValue, content: "\(businessWeek.tuesday?.from ?? "") - \(businessWeek.tuesday?.to ?? "")"),
      BusinessWeekItem(title: BusinessWeekType.wednesday.rawValue, content: "\(businessWeek.wednesday?.from ?? "") - \(businessWeek.wednesday?.to ?? "")"),
      BusinessWeekItem(title: BusinessWeekType.thursday.rawValue, content: "\(businessWeek.thursday?.from ?? "") - \(businessWeek.thursday?.to ?? "")"),
      BusinessWeekItem(title: BusinessWeekType.friday.rawValue, content: "\(businessWeek.friday?.from ?? "") - \(businessWeek.friday?.to ?? "")"),
      BusinessWeekItem(title: BusinessWeekType.saturday.rawValue, content: "\(businessWeek.friday?.from ?? "") - \(businessWeek.friday?.to ?? "")"),
    ]
    self.businessHours = businessWeekItems
  }
  
  func socialMediaItems() -> [SocialMediaItem] {
    var result = [SocialMediaItem]()
    if let safeFacebooks = response.response.contactInfo.website {
      setResultOfSocialMediaItems(safeFacebooks, type: SocialMediaType.facebook.rawValue, &result)
    }
    if let safeYoutubes = response.response.contactInfo.email {
      setResultOfSocialMediaItems(safeYoutubes, type: SocialMediaType.youtube.rawValue, &result)
    }
    if let safeTwitters = response.response.contactInfo.faxNumber {
      setResultOfSocialMediaItems(safeTwitters, type: SocialMediaType.twitter.rawValue, &result)
    }
    return result
  }
  func contactInfos() -> [ContactInfoItem] {
    var result = [ContactInfoItem]()
    if let safeWebsites = response.response.contactInfo.website {
      setResultOfContacInfoItems(safeWebsites, type: ContactInfoType.website.rawValue, &result)
    }
    if let safeEmails = response.response.contactInfo.email {
      setResultOfContacInfoItems(safeEmails, type: ContactInfoType.email.rawValue, &result)
    }
    if let safeFaxNumbers = response.response.contactInfo.faxNumber {
      setResultOfContacInfoItems(safeFaxNumbers, type: ContactInfoType.fax.rawValue, &result)
    }
    if let safePhoneNumbers = response.response.contactInfo.phoneNumber {
      setResultOfContacInfoItems(safePhoneNumbers, type: ContactInfoType.phoneNumber.rawValue, &result)
    }
    if let safeTollFrees = response.response.contactInfo.tollFree {
      setResultOfContacInfoItems(safeTollFrees, type: ContactInfoType.phoneNumber.rawValue, &result)
    }
    return result
  }
  private func setResultOfContacInfoItems(_ safeArrayString: [String], type: String, _ result: inout [ContactInfoItem]) {
    if let itemType = ContactInfoType(rawValue: type) {
      let items = safeArrayString.compactMap { (item) -> ContactInfoItem in
        return ContactInfoItem(title: itemType.rawValue, type: itemType, content: item)
      }
      for item in items {
        if !item.content.isEmpty {
          result.append(item)
        }
      }
    }
  }
  private func setResultOfSocialMediaItems(_ safeArrayString: [String], type: String, _ result: inout [SocialMediaItem]) {
    if let itemType = SocialMediaType(rawValue: type) {
      let items = safeArrayString.compactMap { (item) -> SocialMediaItem in
        return SocialMediaItem(title: itemType.rawValue, type: itemType, content: item)
      }
      for item in items {
        if !item.content.isEmpty {
          result.append(item)
        }
      }
    }
  }
  
}
