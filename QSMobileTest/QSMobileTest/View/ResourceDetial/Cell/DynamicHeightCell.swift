//
//  DynamicHeightCell.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import UIKit
import Former

final class DynamicHeightCell: UITableViewCell {
    
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    var body: String? {
        get { return bodyLabel.text }
        set { bodyLabel.text = newValue }
    }
    var bodyColor: UIColor? {
        get { return bodyLabel.textColor }
        set { bodyLabel.textColor = newValue }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        titleLabel.textColor = .formerColor()
    }
    
    // MARK: Private
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
}
