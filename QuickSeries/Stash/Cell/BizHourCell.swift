//
//  BizHourCell.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/27/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit

class BizHourCell: UITableViewCell {

   
    @IBOutlet weak var lblDay:UILabel!
    @IBOutlet weak var lblTiming:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupTable(title:String,timing:Times)
    {
        lblDay.text = title
        lblTiming.text = timing.from + " " + timing.to
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
