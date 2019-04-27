//
//  AddressCellViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/27/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
import CoreLocation
struct AddressDetail {
    var title: String?
    let label: String?
    var formatedAddress: String?
    let location: CLLocation?
}
struct AddressCellViewViewModel {
    private var _addresses:[AddressDetail] = []
    init(addressesModels: [AddressModel]?) {
        guard let addressesModels = addressesModels else {
            return
        }

        for addressModelObj in addressesModels {
            if let address = getAddressDetail(from: addressModelObj){
                _addresses.append(address)
            }
        }
    }
    
    private func getAddressDetail(from addressModelObj:AddressModel) -> AddressDetail?{
        let title = "Address".uppercased()
        let modelHasNoValue = addressModelObj.address1 == nil && addressModelObj.city == nil && addressModelObj.country == nil && addressModelObj.gps == nil && addressModelObj.label == nil && addressModelObj.state == nil && addressModelObj.zipCode == nil
        if modelHasNoValue {
            return AddressDetail(title: title, label: nil, formatedAddress: "No data available", location: nil)
        }
        var location : CLLocation?
        if let gps = addressModelObj.gps, let latitudeStr = gps.latitude, let longitudeStr = gps.longitude, let latitude = CLLocationDegrees(latitudeStr), let longitude = CLLocationDegrees(longitudeStr) {
            location = CLLocation(latitude: latitude, longitude: longitude)
        }
        var formatedAddress = ""
        if let address1 = addressModelObj.address1{
            formatedAddress = address1
        }
        if let label = addressModelObj.label{
            if formatedAddress.isEmpty{
                formatedAddress = label
            }
            else{
                formatedAddress = "\(formatedAddress), \(label)"
            }
            
        }
        if let city = addressModelObj.city{
            if formatedAddress.isEmpty{
                formatedAddress = city
            }
            else{
                formatedAddress = "\(formatedAddress)\n\(city)"
            }
            
        }
        if let state = addressModelObj.state{
            if formatedAddress.isEmpty{
                formatedAddress = state
            }
            else{
                formatedAddress = "\(formatedAddress), \(state)"
            }
            
        }
        if let zipcode = addressModelObj.zipCode{
            if formatedAddress.isEmpty{
                formatedAddress = zipcode
            }
            else{
                formatedAddress = "\(formatedAddress) \(zipcode)"
            }
            
        }
        if let country = addressModelObj.country{
            if formatedAddress.isEmpty{
                formatedAddress = country
            }
            else{
                formatedAddress = "\(formatedAddress)\n\(country)"
            }
            
        }
        let address = AddressDetail(title: title, label: addressModelObj.label, formatedAddress: formatedAddress, location: location)
        return address
    }
    
    func getDetail(ForIndex pIndex: Int) -> AddressDetail? {
        if _addresses.count > pIndex{
            return _addresses[pIndex]
        }
        return nil
    }
    func getNumberOfRecordsCount() -> Int {
        return _addresses.count
    }
}


