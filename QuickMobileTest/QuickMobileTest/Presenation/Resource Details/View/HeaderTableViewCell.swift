//
//  HeaderTableViewCell.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet private weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(title string: String) {
        labelTitle.text = string
    }
    
}
