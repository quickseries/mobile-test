//
//  ResoursTableViewCell.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

class ResoursTableViewCell: UITableViewCell {

    // MARK: - Properties
    var resource: ResourceViewModel! {
        didSet {
            if let url = resource.imageURL {
                resourceImageView?.downloadImageUsingCache(url: url)
            }
            titleLabel.text = resource.titleText
            addressLabel.text = resource.firstAddressText
        }
    }
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var resourceImageView: RoundableImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
}
