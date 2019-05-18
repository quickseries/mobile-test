//
//  ContactInfoCell.swift
//  Mobile Test
//
//  Created by Alecu Truica on 5/18/19.
//  Copyright © 2019 Alecu Truica. All rights reserved.
//

import UIKit

class ContactInfoCell: UITableViewCell {
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
