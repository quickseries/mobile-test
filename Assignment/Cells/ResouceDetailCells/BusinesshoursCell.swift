//
//  BusinesshoursCell.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit

class BusinesshoursCell: UITableViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(viewModel: BusinessHoursCellViewViewModel?, pIndex :Int) {
        guard let viewModel = viewModel else {
            return
        }
        guard let details = viewModel.getDetail(ForIndex: pIndex) else{
            return
        }
        if let day = details.title{
            dayLabel.text = day
        }

        timingLabel.text = details.timing
    
    }
}
