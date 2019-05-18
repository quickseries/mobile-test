//
//  ContactInfoTableViewCell.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/19/19.
//

import UIKit

class ContactInfoTableViewCell: UITableViewCell {

    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelSubtitle: UILabel!
    @IBOutlet private weak var buttonRight: UIButton!
    @IBOutlet private weak var buttonLeft: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with info: ContactInfo) {
        labelSubtitle.text = info.contact
        labelTitle.text = getTitle(from: info.type)
    }
    
    private func getTitle(from type: ContactType) -> String {
        switch type {
        case .email:
            return "EMAIL ADDRESS"
        case .phoneNumber:
            return "PHONE NUMBER"
        case .tollFree:
            return "TOLL-FREE NUMBER"
        case .faxNumber:
            return "FAX NUMBER"
        case .website:
            return "WEBSITE"
        }
    }
    
    @IBAction private func buttonRightTapped(_ sender: UIButton) {
        
    }
    
    @IBAction private func buttonLeftTapped(_ sender: Any) {
        
    }
    
}
