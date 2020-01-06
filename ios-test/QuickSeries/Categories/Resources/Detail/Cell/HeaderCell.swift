//  HeaderCell.swift
//  QuickSeries
//
//  Created by Franck Clement on 06/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerImageView.contentMode = .scaleAspectFit
        selectionStyle = .none
    }
    
    func configureCell(subtitle: String?, photoURL: URL) {
        headerImageView.image(from: photoURL)
        subtitleLabel.text = subtitle
    }
}
