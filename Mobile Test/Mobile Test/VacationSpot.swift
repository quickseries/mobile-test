//
//  VacationSpot.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import Foundation

enum VacationSpotFields:String{
    case photo = "photo"
    case categoryEID = "category_eid"
    case socialMedia = "socialMedia"
    case addresses = "addresses"
    case contactInfo = "contactInfo"
    case freeText = "freeText"
}


class VacationSpot:Category {
    var categoryEID:String?
    var photo:String?
    var socialMedia:SocialMedia?
    var addresses:[Address]?
    var contactInfo:ContactInfo?
    var freeText:[FreeText]?
    
    required init(json:[String:Any]) {
        super.init(json: json)
        
        self.categoryEID = json[VacationSpotFields.categoryEID.rawValue] as? String
        self.photo = json[VacationSpotFields.photo.rawValue] as? String
     
        if let socialMediaDic = json[VacationSpotFields.socialMedia.rawValue] as? [String:Any]{
            self.socialMedia = SocialMedia(json: socialMediaDic)
        }
        
        if let addressArray = json[VacationSpotFields.addresses.rawValue] as? [[String:Any]] {
            self.addresses = []
            for address in addressArray{
                let currentAddress = Address(json: address)
                if let _ = currentAddress.label, let _ = currentAddress.address1, let _ = currentAddress.city, let _ =  currentAddress.zipCode, let _ = currentAddress.state, let _ = currentAddress.country{
                    self.addresses?.append(currentAddress)
                }
            }
        }
        if let contactInfoDic = json[VacationSpotFields.contactInfo.rawValue] as? [String:Any]{
            self.contactInfo = ContactInfo(json: contactInfoDic)
        }
        if let freeTextArray = json[VacationSpotFields.freeText.rawValue] as? [[String:Any]] {
            self.freeText = []
            for freeText in freeTextArray{
                self.freeText?.append(FreeText(json: freeText))
            }
        }
    }
}
