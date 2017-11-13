//
//  CategoriesTableViewCell.swift
//  QuickSeriesTest
//
//  Created by Mike Bajakian on 2017-11-10.
//  Copyright © 2017 Mike Bajakian. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        titleLabel.text = ""
        descriptionLabel.text = ""
    }
}
