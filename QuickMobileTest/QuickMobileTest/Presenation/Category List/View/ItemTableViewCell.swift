//
//  ItemTableViewCell.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet private weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with model: CategoryItem) {
        labelTitle.text = model.title
    }
    
}
