//
//  VacationSpotModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift
import Realm
public class SpotModel: Object, Codable{
    @objc dynamic public var _id: String?         //"5983a696951cf747207bed42",
    @objc dynamic public var slug: String?         // "places-to-read",
    @objc dynamic public var eid: String?         // "91716028-4fbd-45d4-905f-92df23cacdef",
    @objc dynamic public var photo: String?         //
    @objc dynamic public var title: String?         // "Places to Read",
    @objc dynamic public var description1: String?         // "<p>When you want to get away and read a good @objc@objc dynamic eGuide</p>",
    @objc dynamic public var category_eid: String?         // "83a5bc0d-bae7-4b3f-b8d9-01c969785783",
    dynamic public var __v: Int?         // 0,
    dynamic public var _active: Bool?         // true,
    @objc dynamic public var updated_at: String?         // "2017-08-03T22:41:26.558Z",
    @objc dynamic public var created_at: String?         // "2017-08-03T22:41:26.546Z",
    @objc dynamic public var socialMedia: SocialMediaModel?         // SocialMediaModel?,
    dynamic public var addresses: List<AddressModel>? //[AddressModel]?         // [{}],
    dynamic public var freeText : [JSON]?         // [{}],
    @objc dynamic public var contactInfo: ContactInfoModel?
    @objc dynamic public var bizHours: BizHoursModel?
    override public static func primaryKey() -> String? {
        return "_id"
    }
    enum CodingKeys: String, CodingKey {
        case _id
        case slug
        case eid
        case photo
        case title
        case description1 = "description"
        case category_eid
        case __v
        case _active
        case updated_at
        case created_at
        case socialMedia
        case addresses
        case freeText
        case contactInfo
        case bizHours
    }
    convenience init(_id: String?,
                     slug: String?,
                     eid: String?,
                     photo: String?,
                     title: String?,
                     description1: String?,
                     category_eid: String?,
                     __v: Int?,
                     _active: Bool?,
                     updated_at: String?,
                     created_at: String?,
                     socialMedia: SocialMediaModel?,
                     addresses: List<AddressModel>?,
                     freeText: [JSON]?,
                     contactInfo: ContactInfoModel?,
                     bizHours: BizHoursModel?) {
        self.init()
        self._id = _id
        self.slug = slug
        self.eid = eid
        self.photo = photo
        self.title = title
        self.description1 = description1
        self.category_eid = category_eid
        self.__v = __v
        self._active = _active
        self.updated_at = updated_at
        self.created_at = created_at
        self.socialMedia = socialMedia
        self.addresses = addresses
        self.freeText = freeText
        self.contactInfo = contactInfo
        self.bizHours = bizHours
    }
    var addressesArray:[AddressModel]?{
        var addressesArray:[AddressModel]? = nil
        if let addressesList = addresses  {
            addressesArray = Array(addressesList)
        }
        return addressesArray
    }
    
//    var freeTextArray:[String]?{
//        var freeTextArray:[String]? = nil
//        if let freeTextList = freeText  {
//            freeTextArray = Array(freeTextList)
//        }
//        return freeTextArray
//    }
    
    convenience required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let _id = try container.decodeIfPresent(String.self, forKey: ._id)
        let slug = try container.decodeIfPresent(String.self, forKey: .slug)
        let eid = try container.decodeIfPresent(String.self, forKey: .eid)
        let photo = try container.decodeIfPresent(String.self, forKey: .photo)
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let description1 = try container.decodeIfPresent(String.self, forKey: .description1)
        let category_eid = try container.decodeIfPresent(String.self, forKey: .category_eid)
        let __v = try container.decodeIfPresent(Int.self, forKey: .__v)
        let _active = try container.decodeIfPresent(Bool.self, forKey: ._active)
        let updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at)
        let created_at = try container.decodeIfPresent(String.self, forKey: .created_at)
        let socialMedia = try container.decodeIfPresent(SocialMediaModel.self, forKey: .socialMedia)
        let addressesArray = try container.decodeIfPresent([AddressModel].self, forKey: .addresses)
        let addresses = List<AddressModel>()
        if let addressesArray = addressesArray{
            addresses.append(objectsIn: addressesArray)
        }
        
        
        let freeText = try container.decodeIfPresent([JSON].self, forKey: .freeText)
//        let freeText = List<String>()
//        freeText.append(objectsIn: freeTextArray)
        
        let contactInfo = try container.decodeIfPresent(ContactInfoModel.self, forKey: .contactInfo)
        let bizHours = try container.decodeIfPresent(BizHoursModel.self, forKey: .bizHours)
        
        
        self.init(_id : _id ,slug : slug ,eid : eid ,photo : photo ,title : title ,description1 : description1 ,category_eid : category_eid ,__v : __v ,_active : _active ,updated_at : updated_at ,created_at : created_at ,socialMedia : socialMedia ,addresses : addresses ,freeText : freeText ,contactInfo : contactInfo ,bizHours : bizHours)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(_id, forKey: ._id)
        try container.encode(slug, forKey: .slug)
        try container.encode(eid, forKey: .eid)
        try container.encode(photo, forKey: .photo)
        try container.encode(title, forKey: .title)
        try container.encode(description1, forKey: .description1)
        try container.encode(category_eid, forKey: .category_eid)
        try container.encode(__v, forKey: .__v)
        try container.encode(_active, forKey: ._active)
        try container.encode(updated_at, forKey: .updated_at)
        try container.encode(created_at, forKey: .created_at)
        try container.encode(socialMedia, forKey: .socialMedia)
        var addressesArray:[AddressModel]? = nil
        if let addressesList = addresses  {
            addressesArray = Array(addressesList)
        }
        try container.encode(addressesArray, forKey: .addresses)
        
//        var freeTextArray:[String]? = nil
//        if let freeTextList = freeText  {
//            freeTextArray = Array(freeTextList)
//        }
        try container.encode(freeText, forKey: .freeText)
        try container.encode(contactInfo, forKey: .contactInfo)
        try container.encode(bizHours, forKey: .bizHours)
        
        
    }
    
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}









public class AddressModel: Object, Codable{
    @objc dynamic public var address1: String?     //": "1360 Sunnybrooke",
    @objc dynamic public var label: String?     //": "Pizza Spanos",
    @objc dynamic public var zipCode: String?     //": "H9B 2W5",
    @objc dynamic public var city: String?     //": "DDO",
    @objc dynamic public var state: String?     //": "QC",
    @objc dynamic public var country: String?     //": "Canada",
    @objc dynamic public var gps: GPSModel?     //": ?
    
    
}
public class BizHoursModel: Object, Codable{
    @objc dynamic public var sunday: Hours?
    @objc dynamic public var monday: Hours?
    @objc dynamic public var tuesday: Hours?
    @objc dynamic public var wednesday: Hours?
    @objc dynamic public var thursday: Hours?
    @objc dynamic public var friday: Hours?
    @objc dynamic public var saturday: Hours?
}
public class Hours: Object, Codable{
    @objc dynamic public var from: String?     //": "10:00 AM",
    @objc dynamic public var to: String?     //": "11:45 AM"
}


public class GPSModel: Object, Codable{
    @objc dynamic public var latitude:  String?// "45.490834",
    @objc dynamic public var longitude: String?//"-73.777091"
}
