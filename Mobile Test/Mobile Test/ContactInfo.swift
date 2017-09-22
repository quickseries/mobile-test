//
//  ContactInfo.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import Foundation

enum ContactInfoFields:String {
    case phoneNumber = "phoneNumber"
    case website = "website"
    case email = "email"
    case faxNumber = "faxNumber"
    case tollFree = "tollFree"
}


class ContactInfo:NSObject {
    var phoneNumber:[ContactMethod] = []
    var website:[ContactMethod] = []
    var email:[ContactMethod] = []
    var faxNumber:[ContactMethod] = []
    var tollFree:[ContactMethod] = []
    var allContacts:[ContactMethod] = []
    
    required init(json:[String:Any]) {

        
        if let phoneNumbers = json[ContactInfoFields.phoneNumber.rawValue] as? [String] {
            for number in phoneNumbers{
                if !number.isStringEmpty() {
                    self.phoneNumber.append(ContactMethod(method: ContactInfoFields.phoneNumber.rawValue, details: number, niceName: "PHONE NUMBER"))
                }
            }
        }
        
        if let websites = json[ContactInfoFields.website.rawValue] as? [String]{
            for web in websites{
                if !web.isStringEmpty() {
                    self.website.append(ContactMethod(method: ContactInfoFields.website.rawValue, details: web, niceName: "WEB SITE"))
                }
            }
        }
        
        if let emails = json[ContactInfoFields.email.rawValue] as? [String]{
            for email in emails{
                if !email.isStringEmpty(){
                    self.email.append(ContactMethod(method: ContactInfoFields.email.rawValue, details: email, niceName: "EMAIL"))
                }
            }
        }
        
        if let faxNumbers = json[ContactInfoFields.faxNumber.rawValue] as? [String]{
            for faxNumber in faxNumbers{
                if !faxNumber.isStringEmpty() {
                    self.faxNumber.append(ContactMethod(method: ContactInfoFields.faxNumber.rawValue, details: faxNumber, niceName: "FAX NUMBER"))
                }
            }
        }
        
        if let tollFrees = json[ContactInfoFields.tollFree.rawValue] as? [String]{
            for tollFree in tollFrees{
                if !tollFree.isStringEmpty() {
                    self.tollFree.append(ContactMethod(method: ContactInfoFields.tollFree.rawValue, details: tollFree, niceName: "TOLL-FREE NUMBER"))
                }
            }
        }
        
        self.allContacts = self.phoneNumber + self.website + self.email + self.faxNumber + self.tollFree
    }
}


class ContactMethod:NSObject {
    var method:String
    var details:String
    var niceName:String
    
    init(method:String, details:String, niceName:String) {
        self.method = method
        self.details = details
        self.niceName = niceName
    }
}

extension String {
    func isStringEmpty()->Bool{
        return self.trimmingCharacters(in: .whitespaces).characters.count == 0
    }
}
