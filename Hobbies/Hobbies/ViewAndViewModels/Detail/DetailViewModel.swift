//
//  DetailViewModel.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import Foundation

struct DetailToListModel
{
    struct Section
    {
        var items: [Item]
    }
    
    
    enum Item
    {
        case photo(Photo)
        case titleAndDesc(Title)
        case contactInformation(ContactInformation)
        case addresses(Addresses)
        case businessHours(BusinessHours)
    }
    
    struct Photo
    {
        let urlString: String
    }
    
    struct Title
    {
        let title: String
        let description: String?
    }
    
    struct ContactInformation
    {
        let name: ContactInfoTypes
        let value: String
    }
    
    struct Addresses
    {
        let address: AddressModel
    }
    
    struct BusinessHours
    {
        let day: String
        let from: String
        let to : String
    }
    
    var sections: [Section]
    
    
    static var empty: DetailToListModel {
        return DetailToListModel(sections: [])
        
    }
    
}



class DetailViewModel: NSObject
{
    init(viewController: DetailViewController) {
        self.viewController = viewController
    }
    var viewController: DetailViewController
    var detailObject: ListDetailModelProtocol! {
        didSet {
            self.detailToListModel = self.createDetailArray(detailModelProtocol: self.detailObject)
            self.viewController.tableView?.reloadData()
        }
    }
    var detailToListModel = DetailToListModel.empty

    func titleForHeader(section: Int) -> String {
        guard let item = self.item(at: IndexPath(item: 0, section: section)) else { return "" }
        switch item {
            
        case .photo(_):
            return "Photo"
        case .titleAndDesc(_):
            return "Title And Description"
        case .contactInformation(_):
            return "Contact Information"
        case .addresses(_):
            return "Addresses"
        case .businessHours(_):
            return "Business Hours"
        @unknown default:
            return ""
        }
        return ""
    }
    
    func numberOfSections() -> Int {
        return detailToListModel.sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        return detailToListModel.sections[section].items.count
    }
    
    func item(at indexPath: IndexPath) -> DetailToListModel.Item? {
        return detailToListModel.sections[indexPath.section].items[indexPath.item]
        
    }

    func createDetailArray(detailModelProtocol: ListDetailModelProtocol) -> DetailToListModel
    {
        var responseModel = DetailToListModel.empty
        
        if let title = detailModelProtocol.title {
            let item = DetailToListModel.Item.titleAndDesc(DetailToListModel.Title(title: title, description: detailModelProtocol.description))
            let section = DetailToListModel.Section(items: [item])

            responseModel.sections.append(section)
        }
        
        if let photo = detailModelProtocol.photo {
            let item = DetailToListModel.Item.photo(DetailToListModel.Photo(urlString: photo))
            let section = DetailToListModel.Section(items: [item])
            
            responseModel.sections.append(section)
        }
        
        if let contacts = detailModelProtocol.contactInfo {
            let items = contacts.map { (contact) -> DetailToListModel.Item in
                return DetailToListModel.Item.contactInformation(DetailToListModel.ContactInformation(name: ContactInfoTypes(rawValue: contact.key) ?? ContactInfoTypes.email, value: contact.value.first ?? ""))
            }
            let section = DetailToListModel.Section(items: items)
            
            responseModel.sections.append(section)
        }
        
        if let addresses = detailModelProtocol.addresses {
            let items = addresses.map { (address) -> DetailToListModel.Item in
                return DetailToListModel.Item.addresses(DetailToListModel.Addresses(address: address))
            }
            let section = DetailToListModel.Section(items: items)
            
            responseModel.sections.append(section)
        }
        
        if let businessHours = detailModelProtocol.businessHours {
            let items = businessHours.map { (businessHour) -> DetailToListModel.Item in
                let key = businessHour.key
                return DetailToListModel.Item.businessHours(DetailToListModel.BusinessHours(day: key, from: businessHour.value["from"] ?? "", to: businessHour.value["to"] ?? ""))
            }
            let section = DetailToListModel.Section(items: items)
            responseModel.sections.append(section)
        }
        
        return responseModel
    }
}
