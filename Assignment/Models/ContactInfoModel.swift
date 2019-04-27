//
//  ContactInfoModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/27/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
public class ContactInfoModel: Object, Codable{
    dynamic public var website: List<String>?        //["http://www.quickseries.com"],
    dynamic public var email: List<String>?                               //[""],
    dynamic public var faxNumber: List<String>?         // [""],
    dynamic public var tollFree: List<String>?          //[""],
    dynamic public var phoneNumber: List<String>?       //[""]
    enum CodingKeys: String, CodingKey {
        case website
        case email
        case faxNumber
        case tollFree
        case phoneNumber
    }
    convenience init(website: List<String>?,
                     email: List<String>?,
                     faxNumber: List<String>?,
                     tollFree: List<String>?,
                     phoneNumber: List<String>?) {
        self.init()
        self.website = website
        self.email = email
        self.faxNumber = faxNumber
        self.tollFree = tollFree
        self.phoneNumber = phoneNumber
    }
    var websiteArray:[String]?{
        var websiteArray:[String]? = nil
        if let websiteList = website  {
            websiteArray = Array(websiteList)
        }
        return websiteArray
    }
    
    var emailArray:[String]?{
        var emailArray:[String]? = nil
        if let emailList = email  {
            emailArray = Array(emailList)
        }
        return emailArray
    }
    
    var faxNumberArray:[String]?{
        var faxNumberArray:[String]? = nil
        if let faxNumberList = faxNumber  {
            faxNumberArray = Array(faxNumberList)
        }
        return faxNumberArray
    }
    
    
    var tollFreeArray:[String]?{
        var tollFreeArray:[String]? = nil
        if let tollFreeList = tollFree  {
            tollFreeArray = Array(tollFreeList)
        }
        return tollFreeArray
    }
    
    
    var phoneNumberArray:[String]?{
        var phoneNumberArray:[String]? = nil
        if let phoneNumberList = phoneNumber  {
            phoneNumberArray = Array(phoneNumberList)
        }
        return phoneNumberArray
    }
    
    convenience required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
  
        let websiteArray = try container.decodeIfPresent([String].self, forKey: .website)
        let website = List<String>()
        if let websiteArray = websiteArray {
           website.append(objectsIn: websiteArray)
        }
        
        let emailArray = try container.decodeIfPresent([String].self, forKey: .email)
        let email = List<String>()
        if let emailArray = emailArray{
            email.append(objectsIn: emailArray)
        }
        
        let faxNumberArray = try container.decodeIfPresent([String].self, forKey: .faxNumber)
        let faxNumber = List<String>()
        if let faxNumberArray = faxNumberArray{
            faxNumber.append(objectsIn: faxNumberArray)
        }
    
        let tollFreeArray = try container.decodeIfPresent([String].self, forKey: .tollFree)
        let tollFree = List<String>()
        if let tollFreeArray = tollFreeArray{
            tollFree.append(objectsIn: tollFreeArray)
        }
        
        let phoneNumberArray = try container.decodeIfPresent([String].self, forKey: .phoneNumber)
        let phoneNumber = List<String>()
        if let phoneNumberArray = phoneNumberArray{
            phoneNumber.append(objectsIn: phoneNumberArray)
        }
        
       self.init(website : website, email : email, faxNumber : faxNumber, tollFree : tollFree, phoneNumber : phoneNumber)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        var websiteArray:[String]? = nil
        if let websiteList = website  {
            websiteArray = Array(websiteList)
        }
        try container.encode(websiteArray, forKey: .website)
        
        
        var emailArray:[String]? = nil
        if let emailList = email  {
            emailArray = Array(emailList)
        }
        try container.encode(emailArray, forKey: .email)
        
        
        var faxNumberArray:[String]? = nil
        if let faxNumberList = faxNumber  {
            faxNumberArray = Array(faxNumberList)
        }
        try container.encode(faxNumberArray, forKey: .faxNumber)
        
        
        var tollFreeArray:[String]? = nil
        if let tollFreeList = tollFree  {
            tollFreeArray = Array(tollFreeList)
        }
        try container.encode(tollFreeArray, forKey: .tollFree)
        
        
        var phoneNumberArray:[String]? = nil
        if let phoneNumberList = phoneNumber  {
            phoneNumberArray = Array(phoneNumberList)
        }
        try container.encode(phoneNumberArray, forKey: .phoneNumber)
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
