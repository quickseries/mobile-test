//
//  HoursTableViewCell.swift
//  QuickSeries
//
//  Created by Parth Patel on 15/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class HoursTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCellWith(_ day: String, time: WorkingTime?)
    {
        titleLabel.text = day.uppercased()
        if time == nil {
            detailLabel.text = "CLOSED"
        }
        else {
            detailLabel.text = "\(time?.from ?? "") - \(time?.to ?? "")"
        }
    }
}
