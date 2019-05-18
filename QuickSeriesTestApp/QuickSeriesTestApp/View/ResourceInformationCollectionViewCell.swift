//
//  ResourceInformationCollectionViewCell.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit
protocol ResourceInformationCollectionViewCellDelegate: class {
    func openMail(url: URL)
}
class ResourceInformationCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var resourceInformation: ResourceInformationViewModel! {
        didSet {
            if resourceInformation.url == nil {
                button.isEnabled = false
            }
            self.label.text = resourceInformation.labelText
            setButtonImage()
        }
    }
    weak var delegate: ResourceInformationCollectionViewCellDelegate!
    
    // MARK: - Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    
    // MARK: - Methods
    func setButtonImage() {
        switch resourceInformation.buttonType {
        case .location:
            button.setImage(UIImage(named: Constants.ImageName.locationIcon), for: .normal)
        case .email:
            button.setImage(UIImage(named: Constants.ImageName.mailIcon), for: .normal)
        case .website:
            button.setImage(UIImage(named: Constants.ImageName.websiteIcon), for: .normal)
        case .phoneNumber:
            button.setImage(UIImage(named: Constants.ImageName.callIcon), for: .normal)
        }
    }
    
    
    // MARK: - Actions
    @IBAction func buttonDidTapped(_ sender: UIButton) {
        switch resourceInformation.buttonType {
        case .email:
            if let url = resourceInformation.url {
                delegate.openMail(url: url)
            }
        case .website:
        // TODO: Open Webpage in app
            if let url = resourceInformation.url {
                UIApplication.shared.open(url)
            }
        default:
            if let url = resourceInformation.url {
                UIApplication.shared.open(url)
            }
        }

    }
    
    
    
}
