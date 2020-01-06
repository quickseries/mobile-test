//  ResourceCell.swift
//  QuickSeries
//
//  Created by Franck Clement on 05/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

class ResourceCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
        // Looks better with rounded image !
        self.categoryImageView.layer.cornerRadius = self.categoryImageView.bounds.height / 2
        self.categoryImageView.contentMode = .scaleAspectFill
    }
    
    func configureCell(with resource: Resource) {
        categoryImageView.image(from: resource.photoURL)
        self.titleLabel.text = resource.title
        if let subtitle = resource.subtitle {
            self.subtitleLabel.text = subtitle.htmlFree()
            self.subtitleLabel.isHidden = false
        } else {
            self.subtitleLabel.isHidden = true
        }
    }
}
