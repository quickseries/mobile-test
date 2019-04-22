//
//  ResourceCell.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-22.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import UIKit

class ResourceCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var detail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
