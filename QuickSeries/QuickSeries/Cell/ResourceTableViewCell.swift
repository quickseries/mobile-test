//
//  ResourceTableViewCell.swift
//  QuickSeries
//
//  Created by Parth Patel on 15/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

protocol ResourceTableViewCellProtocol : class {
    func buttonClicked(_ sender: ResourceTableViewCell, button: UIButton)
}

class ResourceTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet var phoneButton: UIButton!
    @IBOutlet var messageButton: UIButton!
    weak var delegateButtonClick: ResourceTableViewCellProtocol?
    
    func configureAddress(address: Addresses)
    {
        let details = "\(address.address ?? "") \n\(address.city ?? "")\(address.zipCode ?? "") \n\(address.country ?? "")"
        titleLabel.attributedText = getAttributedText(titleText1: address.label ?? "", titleText2: details, firstFont: Font.titleFont, secondFont: Font.subTitleFont, firstTextColor: .red, secondTextColor: .black, paragraphSpace: 8)
        phoneButton.setImage(getSystemImages(imageName: "map"), for: .normal)
        phoneButton.isHidden = false
        messageButton.isHidden = true

    }
    
    
    func configureCellWith(_ numbers: String, text: String)
    {
        titleLabel.attributedText = getAttributedText(titleText1: text, titleText2: numbers, firstFont: Font.titleFont, secondFont: Font.subTitleFont, firstTextColor: .red, secondTextColor: .black, paragraphSpace: 8)
        
        switch ContactStrings(rawValue: text) {
            case .phoneNumberText:
                phoneButton.isHidden = false
                messageButton.isHidden = false
                phoneButton.tag = ButtonType.Call.rawValue
                messageButton.tag = ButtonType.Message.rawValue
            case .tollFreeNumberText:
                phoneButton.isHidden = false
                messageButton.isHidden = false
            phoneButton.tag = ButtonType.Call.rawValue
            messageButton.tag = ButtonType.Message.rawValue
            case .faxNumberText:
                phoneButton.isHidden = true
                messageButton.isHidden = true
            case .emailText:
                phoneButton.setImage(getSystemImages(imageName: "paperplane"), for: .normal)
                phoneButton.isHidden = false
                messageButton.isHidden = true
            phoneButton.tag = ButtonType.Email.rawValue
            case .websiteText:
                phoneButton.setImage(getSystemImages(imageName: "arrowshape.turn.up.right"), for: .normal)
                phoneButton.isHidden = false
                messageButton.isHidden = true
            phoneButton.tag = ButtonType.Website.rawValue
            default:
                phoneButton.isHidden = true
                messageButton.isHidden = true
        }
    }

  
    
    func getAttributedText(titleText1:String, titleText2:String, firstFont:UIFont, secondFont:UIFont, firstTextColor:UIColor, secondTextColor:UIColor, paragraphSpace:CGFloat) -> NSAttributedString
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = paragraphSpace//12
        
        let attributeText = NSMutableAttributedString(string: titleText1, attributes:[
            NSAttributedString.Key.foregroundColor: firstTextColor,NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.font: firstFont ])
        attributeText.append(NSMutableAttributedString(string: "\n\(titleText2)", attributes:[
            NSAttributedString.Key.font: secondFont ,NSAttributedString.Key.paragraphStyle:paragraphStyle,
            NSAttributedString.Key.foregroundColor:  secondTextColor]))
        return attributeText
        
    }
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        delegateButtonClick?.buttonClicked(self, button: sender)
    }
    
    func getSystemImages(imageName: String) -> UIImage {
        let systemImage = UIImage(systemName: imageName)
        return systemImage!
    }
    
}

