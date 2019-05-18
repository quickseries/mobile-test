//
//  SocialMediaCell.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-18.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

class SocialMediaCell: UICollectionViewCell {
  
  @IBOutlet weak var socialMediImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  private func setupUI() {
    socialMediImageView.layer.cornerRadius = 30
    socialMediImageView.clipsToBounds = true
  }
  
  func bind(_ viewmodel: SocialMediaItem) {
    socialMediImageView.image = UIImage(named: viewmodel.type.rawValue)
  }
}
