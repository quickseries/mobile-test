//
//  ResourceViewModel.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

class ResourceViewModel {
    
    // MARK: - Properties
    private let resource: Resource
    var imageURL: URL? {
        return URL(string: resource.photo)
    }
    var titleText: String {
        return resource.title
    }
    var firstAddressText: String {
        guard let addresses = resource.addresses, let address = addresses.first else {
            return  Constants.Message.noAddress
        }
        return createAddressString(address: address)
    }
    var descriptionText: String {
        return resource.description.stringOfHTML
    }
    var resourceDetails: [ResourceDetailViewModel] {
        var resourceAllInformation: [ResourceDetailViewModel] = []
        let resourceAddressessDetail = setAddresses()
        let resourceContactsDetail = setContacts()
        resourceAllInformation.append(resourceAddressessDetail)
        resourceAllInformation.append(resourceContactsDetail)
        return resourceAllInformation
    }
    var facebookURL: URL? {
        if let urlString = resource.socialMedia?.facebook?.first {
            return URL(string: urlString)
        } else {
            return nil
        }
    }
    var twitterURL: URL? {
        if let urlString = resource.socialMedia?.twitter?.first {
            return URL(string: urlString)
        } else {
            return nil
        }
    }
    var youtubeURL: URL? {
        if let urlString = resource.socialMedia?.twitter?.first {
            return URL(string: urlString)
        } else {
            return nil
        }
    }
    
    
    
    // MARK: - Methods
    func createAddressString(address: Address) -> String {
        guard let s1 = address.label,
            let s2 = address.address1,
            let s3 = address.city,
            let s4 =  address.state else {
                return  Constants.Message.noAddress
        }
        return (s1 + ", " + s2 + ", " + s3 + ", " + s4 + ".").capitalized
    }
    func setAddresses() -> ResourceDetailViewModel {
        var resourceAddressesInformation: [ResourceInformationViewModel] = []
        if resource.addresses != nil {
            for address in resource.addresses! {
                let labelText = createAddressString(address: address)
                var url: URL?
                if let latitude = address.gps?.latitude, let longitude = address.gps?.longitude {
                    url = URL(string: "http://maps.apple.com/maps?saddr=\(latitude),\(longitude)")
                }
                resourceAddressesInformation.append(ResourceInformationViewModel(labelText: labelText, buttonAction: url, informationButtonType: .location))
            }
        }
        if resourceAddressesInformation.isEmpty {
            resourceAddressesInformation.append(ResourceInformationViewModel(labelText: Constants.Message.noAddress, buttonAction: nil, informationButtonType: .location))
        }
        let resourceAddressDetail = ResourceDetailViewModel(title: "Addressess", resourceInformations: resourceAddressesInformation)
        return resourceAddressDetail
    }
    func setContacts() -> ResourceDetailViewModel {
        var resourceContactsInformation: [ResourceInformationViewModel] = []
        if resource.contactInfo.phoneNumber != nil {
            for phoneNumber in resource.contactInfo.phoneNumber! {
                var labelText = Constants.Message.noPhoneNumber
                if !phoneNumber.isEmpty {
                    labelText = "Phone Number: \(phoneNumber)"
                }
                // TODO: format phone number
                let url = URL(string: phoneNumber)
                resourceContactsInformation.append(ResourceInformationViewModel(labelText: labelText, buttonAction: url, informationButtonType: .phoneNumber))
            }
        }
        // TODO: faxNumber and tollFree goes the same
        if resource.contactInfo.website != nil {
            for website in resource.contactInfo.website! {
                var labelText = Constants.Message.noWebsite
                if !website.isEmpty {
                    labelText = "Website: \(website)"
                }
                let url = URL(string: website)
                resourceContactsInformation.append(ResourceInformationViewModel(labelText: labelText, buttonAction: url, informationButtonType: .website))
            }
        }
        if resource.contactInfo.email != nil {
            for email in resource.contactInfo.email! {
                var labelText = Constants.Message.noEmail
                if !email.isEmpty {
                    labelText = "Email: \(email)"
                }
                let url = URL(string: "mailto:\(email)")
                resourceContactsInformation.append(ResourceInformationViewModel(labelText: labelText, buttonAction: url, informationButtonType: .email))
            }
        }
        if resourceContactsInformation.isEmpty {
            resourceContactsInformation.append(ResourceInformationViewModel(labelText: Constants.Message.noContact, buttonAction: nil, informationButtonType: .phoneNumber))
        }
        let resourceAddressDetail = ResourceDetailViewModel(title: "Contacts", resourceInformations: resourceContactsInformation)
        return resourceAddressDetail
    }
    
    
    
    // MARK: - Initializars
    init(resource: Resource) {
        self.resource = resource
    }
    
}
