//
//  RestaurantCell.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit
import Kingfisher
class DescriptionCell: UITableViewCell {
  
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(viewModel: DescriptionCellViewViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.attributedText = viewModel.description
        if let url = viewModel.photoURL{
            bannerImageView.kf.setImage(with: url)
        }
    }
}
