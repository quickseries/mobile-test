//
//  DetailResourceContactTableViewCell.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-22.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class DetailResourceContactTableViewCell: UITableViewCell {
    @IBOutlet weak var contactTitle: UILabel!
    @IBOutlet weak var contactDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_ info: [String:[String]]?) {
        if let dict = info {
            for (key, value) in dict {
                contactTitle.text = key
                contactDetail.text = value.first
            }
        }
    }
    
}
