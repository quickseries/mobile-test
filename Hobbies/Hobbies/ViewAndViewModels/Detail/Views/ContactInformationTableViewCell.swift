//
//  ContactInformationTableViewCell.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit

class ContactInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var contactTypeLabel: UILabel! {
        didSet {
            self.contactTypeLabel.adjustsFontSizeToFitWidth = true
        }
    }
    @IBOutlet weak var contactValueLabel: UILabel!{
        didSet {
            self.contactValueLabel.textAlignment = .left
        }
    }
    
    var contactInfo: DetailToListModel.ContactInformation! {
        didSet {
            self.contactValueLabel.text = self.contactInfo.value
            self.contactTypeLabel.text = self.contactInfo.name.rawValue
            
        }
    }
}
