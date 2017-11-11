//
//  CategoriesTableViewCell.swift
//  QuickSeriesTest
//
//  Created by Mgrditch Bajakian on 2017-11-10.
//  Copyright © 2017 Mgrditch Bajakian. All rights reserved.
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
