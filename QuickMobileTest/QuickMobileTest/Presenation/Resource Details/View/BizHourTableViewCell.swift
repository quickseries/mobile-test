//
//  BizHourTableViewCell.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/19/19.
//

import UIKit

class BizHourTableViewCell: UITableViewCell {

    
    @IBOutlet private weak var labelDay: UILabel!
    @IBOutlet private weak var labelDuration: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with bizHour: BizHour) {
        labelDay.text =  bizHour.day.rawValue.capitalized
        labelDuration.text = bizHour.duration
    }
    
}
