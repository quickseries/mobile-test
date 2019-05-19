//
//  ResourceDetailViewModel.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxRelay
import PhoneNumberKit

class ResourceDetailViewModel {
    
    private let contactInfo: ContactInfo?
    private let addresses: [Address]
    
    let addressViewModels: [AddressFieldViewModel]
    let contactInfoViewModel: ContactInformationViewModel?
    let image: String
    let title: String
    let categoryDescription: String
    
    let selectedEmail = BehaviorRelay<String?>(value: nil)
    let selectedWebsite = BehaviorRelay<String?>(value: nil)
    let selectedCallPhoneNumber = BehaviorRelay<String?>(value: nil)
    let selectedSmsPhoneNumber = BehaviorRelay<String?>(value: nil)
    let selectedCoordinates = BehaviorRelay<(Double, Double)?>(value: nil)
    let selectedAddress = BehaviorRelay<String?>(value: nil)
    
    init(resource: CategoryResource) {
        self.contactInfo = resource.contactInfo
        let fax = TelephoneParser.shared.parse(number: contactInfo?.faxNumber)
        let tollFree = TelephoneParser.shared.parse(number: contactInfo?.tollFree)
        let phone = TelephoneParser.shared.parse(number: contactInfo?.phoneNumber)
        self.contactInfoViewModel = ContactInformationViewModel(website: contactInfo?.website, email: contactInfo?.email,
                                                                faxNumber: fax, tollFree: tollFree, phoneNumber: phone)
        self.image = resource.photo
        self.title = resource.title
        self.categoryDescription =  "\"\(resource.description.stripHTML())\""
        self.addresses = resource.addresses ?? []
        self.addressViewModels = self.addresses.map { a -> AddressFieldViewModel in
            let addressString = """
            \(a.address)
            \(a.city), \(a.state) \(a.zipCode)
            \(a.country)
            """
            return AddressFieldViewModel(address: addressString, latitude: a.coordinates?.latitude, longitude: a.coordinates?.longitude)
        }
    }
}

extension ResourceDetailViewModel : ContactInformationViewDelegate {
    
    func onEmailClicked() {
        if let email = contactInfo?.email {
            selectedEmail.accept(email)
        }
    }
    
    func onCallTollFreeClicked() {
        if let number = contactInfo?.tollFree {
            selectedCallPhoneNumber.accept(number)
        }
    }
    
    func onCallPhoneNumberClicked() {
        if let number = contactInfo?.phoneNumber {
            selectedCallPhoneNumber.accept(number)
        }
    }
    
    func onSmsTollFreeClicked() {
        if let number = contactInfo?.tollFree {
            selectedSmsPhoneNumber.accept(number)
        }
    }
    
    func onSmsPhoneNumberClicked() {
        if let number = contactInfo?.phoneNumber {
            selectedSmsPhoneNumber.accept(number)
        }
    }
    
    func onWebsiteClicked() {
        if let website = contactInfo?.website {
            selectedWebsite.accept(website)
        }
    }
}

extension ResourceDetailViewModel : AddressesViewDelegate {
    
    func onAddressClicked(model: AddressFieldViewModel) {
        if let lat = model.latitude, let lon = model.longitude {
            selectedCoordinates.accept((lat, lon))
        } else {
            selectedAddress.accept(model.address)
        }
    }
}
