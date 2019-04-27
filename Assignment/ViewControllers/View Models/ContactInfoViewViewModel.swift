//
//  ContactInfoViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/21/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation

import Foundation
struct ContactInfoCellData {
    var title: String?
    var details: [String]?
    var type: ContactType = .none
}
enum ContactType {
    case phoneNumber ,tollFreeNumber ,faxNumber ,email ,website, none
}
struct ContactInfoViewViewModel {
    
    private var contactInfo: ContactInfoModel
    
    private static let dateFormatter: DateFormatter = {
        $0.dateStyle = .medium
        $0.timeStyle = .none
        return $0
    }(DateFormatter())
    
    init(contactInfo: ContactInfoModel) {
        self.contactInfo = contactInfo
    }
    
    var phoneNumbers : ContactInfoCellData{
        return ContactInfoCellData(title: "Phone number".uppercased(), details: self.contactInfo.phoneNumber, type: .phoneNumber)
    }
    var tollFreeNumbers : ContactInfoCellData{
        
        return ContactInfoCellData(title: "toll-free number".uppercased(), details: self.contactInfo.tollFree, type: .tollFreeNumber)
    }
    var faxNumbers : ContactInfoCellData{
        return ContactInfoCellData(title: "fax number".uppercased(), details: self.contactInfo.faxNumber, type: .faxNumber)
    }
    var emails : ContactInfoCellData{
        return ContactInfoCellData(title: "Email Address".uppercased(), details: self.contactInfo.email, type: .email)
    }
    
    var websites : ContactInfoCellData{
        return ContactInfoCellData(title: "Website".uppercased(), details: self.contactInfo.website, type: .website)
    }
  
    var  numberOfContactInfoCells:Int{
        var count = 0
        if let emails = self.contactInfo.email{
            count += emails.count
        }
        if let faxNumbers = self.contactInfo.faxNumber{
            count += faxNumbers.count
        }
        if let phoneNumbers = self.contactInfo.phoneNumber{
            count += phoneNumbers.count
        }
        if let tollFrees = self.contactInfo.tollFree{
            count += tollFrees.count
        }
        if let websites = self.contactInfo.website{
            count += websites.count
        }
       return count
    }
    
    /*
    var posterURL: URL {
        return movie.posterURL
    }
    
    var releaseDate: String {
        return MovieViewViewModel.dateFormatter.string(from: movie.releaseDate)
    }
    
    var rating: String {
        let rating = Int(movie.voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "⭐️"
        }
        return ratingText
    }
    */
}
