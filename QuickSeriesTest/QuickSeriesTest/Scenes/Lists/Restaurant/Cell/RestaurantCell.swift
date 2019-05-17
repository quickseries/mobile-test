//
//  RestaurantCell.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  private func setupUI() {
    backgroundImageView.backgroundColor = NamedColor.lightText.value
    
    titleLabel.textColor = .white
    titleLabel.font = Font(.installed(.MontserratBold), size: .custom(30)).instance
  }
  func bind(_ viewModel: RestaurantItemViewModel) {
    titleLabel.text = viewModel.title
    if let url = viewModel.backgroundImageUrl {
      backgroundImageView.sd_setShowActivityIndicatorView(true)
      backgroundImageView.sd_setIndicatorStyle(.white)
      backgroundImageView.sd_setImage(with: url)
    }
  }
}
