//
//  HomeScreenCategoriesTableViewCell.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit

class HomeScreenCategoriesTableViewCell: UITableViewCell {

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
  
  override func prepareForReuse() {
    self.titleLabel.text = nil
    self.descriptionLabel.text = nil
  }
  
  public func setUp(data: (title: String, description: String)) {
    self.titleLabel.text = data.title
    self.descriptionLabel.text = data.description
  }
}
