//
//  VacationSpotCell.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import SDWebImage

class VacationSpotCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  private func setupUI() {
    backgroundImageView.layer.cornerRadius = 10
    backgroundImageView.clipsToBounds = true
    backgroundImageView.backgroundColor = NamedColor.lightText.value
    
    titleLabel.textColor = .white
    titleLabel.font = Font(.installed(.MontserratBold), size: .standard(.h1)).instance
  }
  func bind(_ viewModel: VacationSpotItemViewModel) {
    titleLabel.text = viewModel.title
    if let url = viewModel.backgroundImageUrl {
      backgroundImageView.sd_setShowActivityIndicatorView(true)
      backgroundImageView.sd_setIndicatorStyle(.white)
      backgroundImageView.sd_setImage(with: url)
    }
  }
}
