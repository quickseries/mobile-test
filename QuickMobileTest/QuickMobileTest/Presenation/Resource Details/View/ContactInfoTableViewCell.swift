//
//  ContactInfoTableViewCell.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/19/19.
//

import UIKit

protocol ContactInfoTableViewCellDelegate: class {
    func tappedAction(with type: ContactActionType, info: ContactInfo)
    func tappedAction(with type: ContactActionType, address: ResourceAddress)
    func tappedAction(with type: ContactActionType, media: SocialMedia)
}

enum ContactActionType {
    case email, call, sms, website, address
}

class ContactInfoTableViewCell: UITableViewCell {
    
    private struct Constant {
        static let imageEmail = "email"
        static let imageCall = "call"
        static let imageSMS = "sms"
        static let imageWebsite = "website"
        static let imageLocation = "location"
    }
    
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelSubtitle: UILabel!
    @IBOutlet private weak var buttonRight: UIButton!
    @IBOutlet private weak var buttonLeft: UIButton!
    
    private var contactInfo: ContactInfo?
    private var address: ResourceAddress?
    weak var delegate: ContactInfoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: For Contact Information Section
    func configureCell(with info: ContactInfo) {
        self.contactInfo =  info
        labelSubtitle.text = info.contact
        labelTitle.text = getTitle(from: info.type)
        setupImages(with: info.type)
    }
    
    private func setupImages(with type: ContactType) {
        switch type {
        case .phoneNumber:
            buttonLeft.isHidden = false
            buttonRight.isHidden = false
            buttonRight.setImage(UIImage(named: Constant.imageCall), for: .normal)
            buttonLeft.setImage(UIImage(named: Constant.imageSMS), for: .normal)
        case .tollFree:
            buttonLeft.isHidden = false
            buttonRight.isHidden = false
            buttonRight.setImage(UIImage(named: Constant.imageCall), for: .normal)
            buttonLeft.setImage(UIImage(named: Constant.imageSMS), for: .normal)
        case .faxNumber:
            buttonLeft.isHidden = false
            buttonRight.isHidden = false
        case .email:
            buttonLeft.isHidden = true
            buttonRight.isHidden = false
            buttonRight.setImage(UIImage(named: Constant.imageEmail), for: .normal)
        case .website:
            buttonLeft.isHidden = true
            buttonRight.isHidden = false
            buttonRight.setImage(UIImage(named: Constant.imageWebsite), for: .normal)
        }
    }
    
    private func getTitle(from type: ContactType) -> String {
        switch type {
        case .phoneNumber: return "PHONE NUMBER"
        case .tollFree: return "TOLL-FREE NUMBER"
        case .faxNumber: return "FAX NUMBER"
        case .email: return "EMAIL ADDRESS"
        case .website: return "WEBSITE"
        }
    }
    
    // MARK: For Address Section
    func configureCell(with address: ResourceAddress) {
        self.address =  address
        labelSubtitle.text = address.completeAddress
        labelTitle.text = "ADDRESS"
        buttonLeft.isHidden = true
        buttonRight.setImage(UIImage(named: Constant.imageLocation), for: .normal)
    }
    
    // MARK: Button Actions
    @IBAction private func buttonRightTapped(_ sender: UIButton) {
        if let info = contactInfo {
            switch info.type {
            case .phoneNumber: delegate?.tappedAction(with: .call, info: info)
            case .tollFree: delegate?.tappedAction(with: .call, info: info)
            case .faxNumber: break
            case .email: delegate?.tappedAction(with: .email, info: info)
            case .website: delegate?.tappedAction(with: .website, info: info)
            }
        } else if let address = self.address {
            delegate?.tappedAction(with: .address, address: address)
        }
    }
    
    @IBAction private func buttonLeftTapped(_ sender: Any) {
        if let info = contactInfo {
            switch info.type {
            case .phoneNumber: delegate?.tappedAction(with: .sms, info: info)
            case .tollFree: delegate?.tappedAction(with: .sms, info: info)
            default: break
            }
        }
    }
}
