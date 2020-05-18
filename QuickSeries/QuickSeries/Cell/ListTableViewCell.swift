//
//  ListTableViewCell.swift
//  QuickSeries
//
//  Created by Parth Patel on 13/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let reuseID = "ListCell"
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCellWith(_ categories: Categories)
    {
        titleLabel.text = categories.title ?? ""
    }

    func configureCellWithResources(_ categories: Resources)
    {
        titleLabel.text = categories.title
    }

}
