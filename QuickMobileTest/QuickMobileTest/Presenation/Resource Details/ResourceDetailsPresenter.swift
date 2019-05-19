//
//  ResourceDetailsPresenter.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation
import UIKit

protocol ResourceDetailsPresenter {
    var numberOfSections: Int { get }
    func numberOfRows(in section: Int) -> Int
    func sectionItemType(at section: Int) -> SectionItemType?
    func sectionTitle(for section: Int) -> String?
    func heightForRow(at indexPath: IndexPath) -> CGFloat
}

class ResourceDetailsPresenterImpl {
    
    struct Constant {
        static let contactInformation = "CONTACT INFORMATION"
        static let addresses = "ADDRESSES"
        static let notes = "NOTES"
        static let socialMedia = "SOCIAL MEDIA"
        static let businessHours = "BUSINESS HOURS"
    }
    
    private let categoryItem: ResourceItem
    private weak var view: ResourceDetailsView?
    
    init(categoryItem: ResourceItem,view: ResourceDetailsView) {
        self.categoryItem =  categoryItem
        self.view = view
        DispatchQueue.main.async {
            view.reloadData()
        }
        view.setTitle(with: categoryItem.title)
    }
    
}

extension ResourceDetailsPresenterImpl: ResourceDetailsPresenter {
    
    var numberOfSections: Int {
        return categoryItem.sectionTypes.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        guard section < categoryItem.sectionTypes.count else {
            return 0
        }
        
        switch categoryItem.sectionTypes[section] {
        case .photo(_):
            return 1
        case .resourceDetail(_):
            return 1
        case .contact(let contacts):
            return contacts.count
        case .address(let addresses):
            return addresses.count
        case .socialMedia(let medias):
            if medias.count > 0 {
                return 1
            }
            return 0
        case .bizHours(let hours):
            return hours.count
        }
    }
    
    func sectionItemType(at section: Int) -> SectionItemType? {
        
        guard section < categoryItem.sectionTypes.count else {
            return nil
        }
        return categoryItem.sectionTypes[section]
    }
    
    func sectionTitle(for section: Int) -> String? {
        
        guard section < categoryItem.sectionTypes.count else {
            return nil
        }
        
        switch categoryItem.sectionTypes[section] {
        case .photo(_):
            return nil
        case .resourceDetail(_):
            return nil
        case .contact(_):
            return Constant.contactInformation
        case .address(_):
            return Constant.addresses
        case .socialMedia(_):
            return Constant.socialMedia
        case .bizHours(_):
            return Constant.businessHours
        }
    }
    
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        guard indexPath.section < categoryItem.sectionTypes.count else {
            return 0
        }
        
        switch categoryItem.sectionTypes[indexPath.section] {
        case .photo(_):
            return 230
        default:
            return UITableView.automaticDimension
        }
    }
    
}
