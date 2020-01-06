//  CategoryCell.swift
//  QuickSeries
//
//  Created by Franck Clement on 04/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    
    func configureCell(with category: Category) {
        self.titleLabel.text = category.title
        if let subtitle = category.subtitle {
            self.subtitleLabel.text = subtitle
            self.subtitleLabel.isHidden = false
        } else {
            self.subtitleLabel.isHidden = true
        }
    }
}
