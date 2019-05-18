//
//  AddressCell.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-18.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import Domain

class AddressCell: UITableViewCell {
  @IBOutlet weak var addressTitleLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var countryLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  private func setupUI() {
    addressTitleLabel.text = "ADDRESS"
    addressTitleLabel.font = Font(.installed(.MontserratBold), size: .standard(.h4)).instance
    addressTitleLabel.textColor = NamedColor.beautifulRed.value
    [addressLabel, cityLabel, countryLabel].forEach { (lb) in
      lb?.font = Font(.installed(.MontserratMedium), size: .standard(.h4)).instance
      lb?.textColor = NamedColor.lightText.value
    }
  }
  func bind(_ viewmodel: Adress) {
    addressLabel.text = (viewmodel.address ?? "") + "," + (viewmodel.label ?? "")
    cityLabel.text = (viewmodel.city ?? "") + (viewmodel.zipCode ?? "")
    countryLabel.text = viewmodel.country ?? ""
  }
  @IBAction private func openMapButtonPressed(_ sender: UIButton) {
    
  }
}
