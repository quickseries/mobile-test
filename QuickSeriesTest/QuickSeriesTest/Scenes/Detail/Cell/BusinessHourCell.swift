//
//  BusinessHourCell.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-18.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

class BusinessHourCell: UITableViewCell {
  @IBOutlet weak var weekdayTitleLabel: UILabel!
  @IBOutlet weak var hourLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  private func setupUI() {
    let font = Font(.installed(.MontserratMedium), size: .standard(.h4)).instance
    weekdayTitleLabel.font = font
    hourLabel.font = font
    weekdayTitleLabel.textColor = NamedColor.darkText.value
    hourLabel.textColor = NamedColor.lightText.value
  }
  func bind(_ viewmodel: BusinessWeekItem) {
    weekdayTitleLabel.text = viewmodel.title
    if viewmodel.content.hasPrefix("CLOSED") || viewmodel.content.hasPrefix("-") {
      hourLabel.text = "CLOSED"
    } else {
      hourLabel.text = viewmodel.content
    }
  }
}
