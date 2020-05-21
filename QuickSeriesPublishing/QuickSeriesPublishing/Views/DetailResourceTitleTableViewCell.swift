//
//  DetailResourceTitleTableViewCell.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-22.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class DetailResourceTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_ text: String?) {
        title.text = text
    }
    
}
