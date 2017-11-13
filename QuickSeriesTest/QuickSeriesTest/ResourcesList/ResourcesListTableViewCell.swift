//
//  ResourcesListTableViewCell.swift
//  QuickSeriesTest
//
//  Created by Mike Bajakian on 2017-11-11.
//  Copyright © 2017 Mike Bajakian. All rights reserved.
//

import UIKit

class ResourcesListTableViewCell: UITableViewCell {

    @IBOutlet weak var resourceImage: UIImageView!
    @IBOutlet weak var resourceTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        resourceTitleLabel.text = ""
    }
}
