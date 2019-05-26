//
//  LocationDetailViewModel.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation
import UIKit

struct LocationDetailTableCells {
    static let titleAndDiscriptionCell = "TitleAndDiscriptionCell"
    static let contactInfoCell  = "ContactInfoCell"
    static let addressCell = "AddressCell"
    static let socialMediaCell = "SocialMediaCell"
}

enum LocationDetailModelItemType {
    case titleAndDescription
    case contactInfomation
    case address
    case socialMedia
    case businessHours
}

protocol LocationDetailModelItem {
    var type: LocationDetailModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class LocationDetailViewModel:NSObject {
    var items = [LocationDetailModelItem]()
    
    init(locationDetails: Location) {
        
        if let title = locationDetails.title, let description = locationDetails.description, let imageURL = locationDetails.photo {
            let titleDiscription = TitleAndDescription(title, description, imageURL)
            items.append(titleDiscription)
        }
        
        if let contactInfo = locationDetails.contactInfo {
            let contactinformation = ContactInfomation(contactInfo: contactInfo)
            items.append(contactinformation)
        }
        
        if let address = locationDetails.addresses {
            let address = Address(address: address)
            items.append(address)
        }
        
        if let social = locationDetails.socialMedia {
            let social = SocialMedias(social: social)
            items.append(social)
        }
    }
}

class TitleAndDescription : LocationDetailModelItem {
    var type: LocationDetailModelItemType {
        return .titleAndDescription
    }
    var sectionTitle: String {
        return "Resouce"
    }
    var rowCount: Int {
        return 1
    }
    
    var title: String
    var description: String
    var imageURL: String
    
    init(_ title: String, _ description: String, _ imageURL: String) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
}

class Address: LocationDetailModelItem {
    var type: LocationDetailModelItemType {
        return .address
    }
    var sectionTitle: String {
        return "Address"
    }
    var rowCount: Int {
        return address.count
    }
    var address: [Addresses]
    
    init(address: [Addresses]) {
        self.address = address
    }
}

class SocialMedias: LocationDetailModelItem {
    var type: LocationDetailModelItemType {
        return .socialMedia
    }
    
    var sectionTitle: String {
        return "Social Media"
    }
    
    var rowCount: Int{
        return 1
    }
    
    var socialMedia: SocialMedia
    init(social: SocialMedia) {
        self.socialMedia = social
    }
    
}

class ContactInfomation: LocationDetailModelItem {
    var type: LocationDetailModelItemType {
        return .contactInfomation
    }
    var sectionTitle: String {
        return "Contact Infomation"
    }
    var rowCount: Int {
        return contactInfo.contactCount()
    }
    var contactInfo : ContactInfo
    
    init(contactInfo: ContactInfo) {
        self.contactInfo = contactInfo
    }
}

extension LocationDetailViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemT = items[indexPath.section]
        switch itemT.type {
        case .contactInfomation:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: LocationDetailTableCells.contactInfoCell, for: indexPath) as? ContactInfoCell {
                if let data = itemT as? ContactInfomation {
                    cell.title.text = data.contactInfo.contactsDetails()[indexPath.row].contactType.contactTitle().capitalized
                    cell.contactButton.setImage(UIImage(named:data.contactInfo.contactsDetails()[indexPath.row].contactType.contactTitle()), for: .normal)
                    cell.descriptionLable.text =  data.contactInfo.contactsDetails()[indexPath.row].contact
                }
                return cell
            }
            
        case .titleAndDescription:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: LocationDetailTableCells.titleAndDiscriptionCell, for: indexPath) as? TitleAndDiscriptionCell {
                if let data = itemT as? TitleAndDescription {
                    cell.title.text = data.title
                    cell.discription.text = data.description.convertHTMLTwoAttributed?.string
                    cell.backgroundImage?.downloaded(from: data.imageURL)
                }
                return cell
            }
            
        case .address:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: LocationDetailTableCells.addressCell, for: indexPath) as? AddressCell {
                if let data = itemT as? Address {
                    cell.title.text = data.sectionTitle
                    cell.discription.text = data.address[indexPath.row].getCompleteAddress()
                    
                }
                return cell
            }
            
        case .socialMedia:
            
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: LocationDetailTableCells.socialMediaCell, for: indexPath) as? SocialMediaCell {
                if let data = itemT as? SocialMedias {
                    cell.socialMedia = data.socialMedia.getSocailMedia()
                    cell.setupButtons()
                }
                return cell
            }
            
        default: break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
}

extension LocationDetailViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height: CGFloat = 60.0
        switch items[indexPath.section].type {
        case .address            : height = 120.0
        case .contactInfomation  : break
        case .titleAndDescription: height = 100.0
        case .socialMedia: break
        case .businessHours: break
        }
        return height
    }
}
