//
//  DetailViewTableViewCell.swift
//  QuickSeriesTest
//
//  Created by Mike Bajakian on 2017-11-12.
//  Copyright © 2017 Mike Bajakian. All rights reserved.
//

import UIKit

class DetailViewTableViewCell: UITableViewCell {

    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailValueLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var cellType: Int = detailViewCellType.unknown.rawValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        detailTitleLabel.text = ""
        detailValueLabel.text = ""
        
        // adjust detail label parameters to fit multiline address
        detailValueLabel.minimumScaleFactor = 0.25
        detailValueLabel.adjustsFontSizeToFitWidth = true
        detailValueLabel.lineBreakMode = .byClipping
        detailValueLabel.numberOfLines = 0
    }
}
