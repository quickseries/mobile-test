//
//  ResourceDetailDataSource.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-19.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import UIKit

typealias ResourceDetails = Dictionary<String, AnyObject>

enum Sections: CaseIterable {
    case address
    case contact
}

enum ResourceDetailKey: String, CaseIterable {
    case title
    case description
    case photo
    case addresses
    case contactInfo
    
    var description: String {
        return self.rawValue
    }
}

enum AddressKey: String, CaseIterable {
    case address1
    case zipCode
    case city
    case state
    case country
    
    var description: String {
        return self.rawValue
    }
    
    var lowercaseKey: String {
        return self.rawValue.lowercased()
    }
    
    var capitalisedKey: String {
        switch self {
        case .address1:
            return "Address"
        case .zipCode:
            return "Zip Code"
        default:
            return self.rawValue.capitalized
        }
    }
}

enum ContactKey : String {
    case website
    case email
    case tollFree
    case faxNumber
    case phoneNumber
    
    var description: String {
        return self.rawValue
    }
    
    var lowercaseKey: String {
        return self.rawValue.lowercased()
    }
    
    var capitalisedKey: String {
        switch self {
        case .phoneNumber:
            return "Phone Number"
        case .tollFree:
            return "Toll Free"
        case .faxNumber:
            return "Fax Number"
        default:
            return self.rawValue.capitalized
        }
    }
}

class ResourceDetailDataSource: NSObject, UITableViewDataSource {
    let resourceDetails: ResourceDetails?
    let address: [String: Any]?
    let contacts: [String: [String]]?
    let contactKeys: [String]?
    
    
    init(withResourceDetails resourceDetails: ResourceDetails) {
        self.resourceDetails = resourceDetails
        let addresses = resourceDetails[ResourceDetailKey.addresses.description] as? [[String: Any]]
        self.address = addresses?.first
        self.contacts = resourceDetails[ResourceDetailKey.contactInfo.description] as? [String: [String]]
        let cleanedContacts = self.contacts?.compactMapValues({ (strArray) -> String? in
            if strArray.first == "" {
                return nil
            }
            return strArray.first
        })
        self.contactKeys = (cleanedContacts != nil) ? Array(cleanedContacts!.keys): nil
        super.init()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if self.address == nil {
                return 0
            } else {
                return self.address?.keys.count == 0 ? 0: 1
            }
        case 1:
            return self.contactKeys?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            if self.address == nil {
                return ""
            } else {
                return self.address?.keys.count == 0 ? "": "Street Address"
            }
        case 1:
            if self.contactKeys == nil {
                return ""
            } else {
                return self.contacts?.keys.count == 0 ? "": "Contact Information"
            }
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _ = self.resourceDetails else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceDetailCell", for: indexPath) as! ResourceCell
        
        switch indexPath.section {
        case 0:
            cell.label?.text = AddressKey.address1.capitalisedKey
            if let address = self.address {
                let flatAddress = flattenCollection(collection: address)
                cell.detail?.text = concatenateAddress(forAddressDict: flatAddress)
            } else {
                cell.detail?.text = "None"
            }
        case 1:
            if let contactKeys = self.contactKeys, let contacts = self.contacts {
                let key = contactKeys[indexPath.row]
                let contact = contacts[key]!
                let keyLabel = getCapitalizedLabel(forContactKey: key)
                cell.label?.text = keyLabel
                cell.detail?.text = contact.first
                
                switch key {
                case ContactKey.website.description:
                    cell.detail?.textColor = UIColor.blue
                    cell.selectionStyle = .default
                case ContactKey.phoneNumber.description, ContactKey.tollFree.description, ContactKey.faxNumber.description:
                    if let number = contact.first, let formattedPhone = number.formatPhoneNumber() {
                        cell.detail?.text = formattedPhone
                        cell.detail?.textColor = UIColor.darkText
                        cell.selectionStyle = .none
                    }
                default:
                    cell.detail?.textColor = UIColor.darkText
                    cell.selectionStyle = .none
                }
            }
        default:
            break
        }
        return cell
    }
    
    //MARK: - Helper Methods
    
    func flattenCollection<T>(collection: T) -> [String: String] {
        var flattenedCollection: [String: String] = [:]
        var recursiveResult: [String: String] = [:]
        
        if let arr = collection as? Array<Any> {
            for item in arr {
                if let dict = item as? Dictionary<String, Any>  {
                    recursiveResult = flattenCollection(collection: dict)
                } else if let anotherArr = item as? Array<Any> {
                    recursiveResult = flattenCollection(collection: anotherArr)
                }
                flattenedCollection.merge(withDictionary: recursiveResult)
            }
        } else if let dict = collection as? Dictionary<String, Any> {
            for (key, value) in dict {
                if let dictValue = value as? Dictionary<String, Any>  {
                    recursiveResult = flattenCollection(collection: dictValue)
                    flattenedCollection.merge(withDictionary: recursiveResult)
                } else if let arrValue = value as? Array<Any> {
                    if let strArr = arrValue as? Array<String>, let strValue = strArr.first {
                        flattenedCollection.updateValue(strValue, forKey: key)
                    }else {
                        recursiveResult = flattenCollection(collection: arrValue)
                        flattenedCollection.merge(withDictionary: recursiveResult)
                    }
                } else if value is String {
                    flattenedCollection.updateValue(value as! String, forKey: key)
                }
            }
        }
        return flattenedCollection
    }
    
    func concatenateAddress(forAddressDict addressDict: [String: String]) -> String {
        var concatenatedAddress = ""
        if let address = addressDict[AddressKey.address1.description] {
            concatenatedAddress.append("\(address)\n")
        }
        if let city = addressDict[AddressKey.city.description] {
            concatenatedAddress.append("\(city)\n")
        }
        if let state = addressDict[AddressKey.state.description] {
            concatenatedAddress.append("\(state)  ")
        }
        if let country = addressDict[AddressKey.country.description] {
            concatenatedAddress.append("\(country)\n")
        }
        if let zip = addressDict[AddressKey.zipCode.description] {
            concatenatedAddress.append("\(zip)")
        }
        return concatenatedAddress
    }
    
    func cleanResourceContacts(forContactsDict contactsDict: [String: [String]]) -> [String: String]? {
        return contactsDict.compactMapValues({ (strArray) -> String? in
            if strArray.first == "" {
                return nil
            }
            return strArray.first
        })
    }
    
    func getCapitalizedLabel(forContactKey contactKey: String ) -> String? {
        var contactLabel: String? = nil
        if let enumKey = ContactKey(rawValue: contactKey) {
            contactLabel = enumKey.capitalisedKey
        }
        return contactLabel
    }
}
