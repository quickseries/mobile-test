//
//  Constants.swift
//  QuickSeriesTest
//
//  Created by Mike Bajakian on 2017-11-10.
//  Copyright © 2017 Mike Bajakian. All rights reserved.
//

import Foundation


enum CellIdentifiers:String {
    case categoryCellIdentifier = "categoryCellIdentifier"
    case resourceListCellIdentifier = "resourceListCellIdentifier"
    case detailViewCellIdentifier = "detailViewCellIdentifier"
}


enum SegueIdentifiers:String {
    case resourcesListSegueIdentifier = "resourcesListSegueIdentifier"
    case detailViewSegueIdentifier = "detailViewSegueIdentifier"
}


enum FileNames:String {
    case categoriesFileName = "categories"
    case restaurantsFileName = "restaurants"
    case vacationSpotsFileName = "vacation-spot"
}


enum FileTypes:String {
    case jsonFileType = "json"
}


enum ViewTitles:String {
    case categories = "Categories"
    case restaurants = "Restaurants"
    case vacationSpots = "Vacations"
    case details = "Details"
}


enum KeyValues:String {
    case titleKeyValue = "title"
    case descriptionKeyValue = "description"
    case photoKeyValue = "photo"
    
    case addressesKeyValue = "addresses"
    case address1KeyValue = "address1"
    case cityKeyValue = "city"
    case stateKeyValue = "state"
    case zipCodeKeyValue = "zipCode"
    case countryKeyValue = "country"
    
    case contactInfoKeyValue = "contactInfo"
    case websiteKeyValue = "website"
    case emailKeyValue = "email"
    case phoneNumberKeyValue = "phoneNumber"

    case cellTypeKeyValue = "cellType"
    case cellDataKeyValue = "cellData"
}


enum ErrorMessages:String {
    case unknownCategory = "Unknown Title"
    case unknownDescription = "Unknown Description"
}


enum sortingStatus {
    case unsorted
    case sortedAtoZ
    case sortedZtoA
}


enum detailViewSectionIndexes: Int {
    case contacts = 0
    case addresses = 1
}


enum detailViewSectionTitles: String {
    case contactsSectionTitle = "CONTACT INFORMATION"
    case addressesSectionTitle = "ADDRESS"
}


enum detailViewCellType: Int {
    case unknown = 0
    case phone = 1
    case email = 2
    case website = 3
    case address = 4
}


enum detailViewCellTitles: String {
    case unkown = "UNKNOWN"
    case phone = "PHONE NUMBER"
    case email = "EMAIL ADDRESS"
    case website = "WEBSITE"
    case address = "ADDRESS"
}


enum sortButtonTitles:String {
    case alphabeticallyIncreasing = "A -> Z"
    case alphabeticallyDecreasing = "Z -> A"
}


enum imageNames:String {
    case imageViewPlaceHolder = "imagePlaceholder"
    case phoneLogo = "phone"
    case emailLogo = "email"
    case websiteLogo = "website"
    case addressLogo = "address"
}

