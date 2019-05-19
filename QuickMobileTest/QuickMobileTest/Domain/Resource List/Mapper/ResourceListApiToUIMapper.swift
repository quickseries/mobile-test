//
//  ResourceListApiToUIMapper.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

struct ResourceListApiToUIMapper {
    
    static func convert(from resources: [ResourceResponse]) -> [ResourceItem] {
        return resources.map{ getResourceItem(from: $0) }
    }
    
    private static func getResourceItem(from resource: ResourceResponse) -> ResourceItem {
        
        var sectionTypes = [SectionItemType]()
        
        // Extract photo url
        if let photoUrl = resource.photo {
            sectionTypes.append(SectionItemType.photo(photoUrl))
        }
        
        // Add title and description
        let details = [resource.title, resource.description].compactMap{ $0 }
        if !details.isEmpty {
            sectionTypes.append(SectionItemType.resourceDetail(resource.title, resource.description?.withoutHtml))
        }
        
        // Add contacts
        if let contactInfoResponse = resource.contactInfo {
            sectionTypes.append(SectionItemType.contact(getContactsInfo(from: contactInfoResponse)))
        }
        
        // Add Address Section
        if let addresses = resource.addresses {
            sectionTypes.append(SectionItemType.address(getResourceAddresses(from: addresses)))
        }
        
        // Add Social Media Section
        if let socialMediaResponse = resource.socialMedia {
            sectionTypes.append(SectionItemType.socialMedia(getSocialMedias(from: socialMediaResponse)))
        }
        
        if let bizHoursResponse =  resource.bizHours {
            sectionTypes.append(SectionItemType.bizHours(getBizHours(from: bizHoursResponse)))
        }
        
        return ResourceItem(title: resource.title ?? "", description: resource.description ?? "", isActive: resource._active, sectionTypes: sectionTypes)
    }
    
    private static func getContactsInfo(from contactInfoResponse: ContactInfoResponse) -> [ContactInfo] {
        
        let allContacts = [contactInfoResponse.phoneNumber,
                           contactInfoResponse.tollFree,
                           contactInfoResponse.faxNumber,
                           contactInfoResponse.email,
                           contactInfoResponse.website]
        let allContactTypes: [ContactType] = [.phoneNumber, .tollFree, .faxNumber, .email, .website]
        
        let contacts = zip(allContacts, allContactTypes).compactMap { (args) -> [ContactInfo]? in
            let (arrStrings, type) = args
            guard let strings = arrStrings else { return nil }
            return strings.compactMap({ (str) -> ContactInfo? in
                if !str.isEmpty {
                    return ContactInfo(contact: str, type: type)
                }
                return nil
            })
            }.flatMap{ $0 }
        return contacts
    }
    
    private static func getResourceAddresses(from addresses: [AddressResponse]) -> [ResourceAddress] {
        let resourceAddresses = addresses.map { (add) -> ResourceAddress in
            let combinedAddress = [add.address1, add.label, add.city, add.state, add.zipCode, add.country].compactMap({ (str) -> String? in
                if !(str?.isEmpty ?? true) {
                    return str
                }
                return nil
            }).joined(separator: ", ")
            var latLng: LatLng?
            if let lat = add.gps?.latitude?.toDouble, let lng = add.gps?.longitude?.toDouble {
                latLng = LatLng(latitude: lat, longitude: lng)
            }
            return ResourceAddress(completeAddress: combinedAddress, latLng: latLng)
        }
        return resourceAddresses
    }
    
    private static func getSocialMedias(from response: SocialMediaResponse) -> [SocialMedia] {
        let allSocialMedias = [response.facebook,
                               response.twitter,
                               response.youtubeChannel]
        let allContactTypes: [SocailMediaType] = [.facebook, .twitter, .youtube]
        
        let medias = zip(allSocialMedias, allContactTypes).compactMap { (args) -> [SocialMedia]? in
            let (arrStrings, type) = args
            guard let strings = arrStrings else { return nil }
            return strings.compactMap({ (str) -> SocialMedia? in
                if !str.isEmpty {
                    return SocialMedia(link: str, type: type)
                }
                return nil
            })
            }.flatMap{ $0 }
        return medias
    }
    
    private static func getBizHours(from response: BizHourResponse) -> [BizHour] {
        let allBizHours = [response.sunday,
                           response.monday,
                           response.tuesday,
                           response.wednesday,
                           response.thursday,
                           response.friday,
                           response.saturday
        ]
        
        let allDays: [BizHourDay] = [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]
        
        let bizHours = zip(allBizHours, allDays).compactMap { (args) -> BizHour? in
            let (dayResponse, type) = args
            guard let day = dayResponse else { return nil }
            let duration = [day.from, day.to].compactMap { $0 }.joined(separator: " - ")
            return BizHour(day: type, duration: duration)
        }
        return bizHours
    }
    
}
