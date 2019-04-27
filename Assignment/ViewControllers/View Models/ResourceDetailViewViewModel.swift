//
//  CategoryListViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//


import Foundation
enum kSections:Int {
    case header = 0, contactInfo, addresses, notes, socailMedia, businessHours
    static let allValues = [header, contactInfo, addresses, notes, socailMedia, businessHours]
}

class ResourceDetailViewViewModel {
    static let allSectionHeadings = ["", "Contact Info".uppercased(), "addresses".uppercased(), "notes".uppercased(), "socail Media".uppercased(), "business Hours".uppercased()]
    var descriptionCellViewViewModel :DescriptionCellViewViewModel?
    var contactInfoCellViewViewModel : ContactInfoCellViewViewModel?
    var addressCellViewViewModel : AddressCellViewViewModel?
    var notesCellViewViewModel : NotesCellViewViewModel?
    var socialMediaCellViewViewModel : SocialMediaCellViewViewModel?
    var businessHourCellViewViewModel:BusinessHoursCellViewViewModel?
    init(spotModel: SpotModel) {
        descriptionCellViewViewModel = DescriptionCellViewViewModel.init(spotModel: spotModel)
        contactInfoCellViewViewModel  = ContactInfoCellViewViewModel.init(contactInfoModel: spotModel.contactInfo)
        addressCellViewViewModel = AddressCellViewViewModel.init(addressesModels: spotModel.addressesArray)
        notesCellViewViewModel = NotesCellViewViewModel.init(freeTexts: spotModel.freeText)
        socialMediaCellViewViewModel = SocialMediaCellViewViewModel.init(socialMediaModel: spotModel.socialMedia)
        socialMediaCellViewViewModel = SocialMediaCellViewViewModel.init(socialMediaModel: spotModel.socialMedia)
        businessHourCellViewViewModel = BusinessHoursCellViewViewModel.init(bizHours: spotModel.bizHours)
    }
    

    func sectionHeader(forSection section: Int) -> String {
        if ResourceDetailViewViewModel.allSectionHeadings.count > section{
            return ResourceDetailViewViewModel.allSectionHeadings[section]
        }
        return ""
    }
    
    var numberOfSections:Int{
        return kSections.allValues.count
    }
    
    func numberOfRows(forSection section: Int) -> Int {
        switch section {
        case kSections.header.rawValue:
            guard let descriptionCellViewViewModel = descriptionCellViewViewModel else{
                return 0
            }
            if descriptionCellViewViewModel.photoURL != nil ||
                descriptionCellViewViewModel.title != nil ||
                descriptionCellViewViewModel.description != nil {
                return 1
            }
            else{
                return 0
            }
        case kSections.contactInfo.rawValue:
            guard let contactInfos = self.contactInfoCellViewViewModel else{
                return 0
            }
            return contactInfos.getNumberOfRecordsCount()
        case kSections.addresses.rawValue:
            guard let addresses = self.addressCellViewViewModel else{
                return 0
            }
            return addresses.getNumberOfRecordsCount()
        case kSections.notes.rawValue:
            guard let notesCellViewViewModel = self.notesCellViewViewModel else{
                return 0
            }
            return notesCellViewViewModel.getNumberOfRecordsCount()
        case kSections.socailMedia.rawValue:
            guard let socialMediaCellViewViewModel = self.socialMediaCellViewViewModel else{
                return 0
            }
            return socialMediaCellViewViewModel.getNumberOfRecordsCount()
        case kSections.businessHours.rawValue:
            guard let businessHourCellViewViewModel = self.businessHourCellViewViewModel else{
                return 0
            }
            return businessHourCellViewViewModel.getNumberOfRecordsCount()
        default:
            return 0
        }
    }
    
   
}





