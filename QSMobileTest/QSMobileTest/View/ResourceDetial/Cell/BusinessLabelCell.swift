//
//  BusinessLabelCell.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import UIKit
import Former


final class BusinessLabelCell: UITableViewCell, InlineDatePickerFormableRow, InlinePickerFormableRow {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var displayLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = .formerColor()
        displayLabel.textColor = .formerSubColor()
        
        displayLabel.numberOfLines = 0
        displayLabel.sizeToFit()
    }
    
    func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    func formDisplayLabel() -> UILabel? {
        return displayLabel
    }
    
    func updateWithRowFormer(_ rowFormer: RowFormer) {}
}
