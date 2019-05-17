//
//  CategoryCell.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var containerView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  
  func bind(_ viewModel: CategoryItemViewModel) {
    titleLabel.text = viewModel.title
    descriptionLabel.isHidden = viewModel.description.isEmpty
    descriptionLabel.text = viewModel.description
  }

  override func layoutSublayers(of layer: CALayer) {
    
  }
  private func setupUI() {
    titleLabel.textColor = .white
    titleLabel.font = Font(.installed(.MontserratBold), size: .standard(.h1)).instance
    descriptionLabel.textColor = .white
    descriptionLabel.font = Font(.installed(.MontserratMedium), size: .standard(.h4)).instance
  }
}
