//
//  DetailResourceAddressTableViewCell.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-22.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class DetailResourceAddressTableViewCell: UITableViewCell {
    @IBOutlet weak var addressTitle: UILabel!
    @IBOutlet weak var addressDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(_ info: Address) {
        addressDetail.text = (info.address ?? "") // + (info.city ?? "")  + (info.zipCode ?? "") + (info.country ?? "")
    }
    
}
