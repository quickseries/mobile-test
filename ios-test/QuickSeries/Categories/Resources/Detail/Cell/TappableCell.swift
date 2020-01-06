//  TappableCell.swift
//  QuickSeries
//
//  Created by Franck Clement on 06/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

class TappableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var trailingIconLabel: UILabel!
    
    private(set) var type: InformationType?
    private(set) var content: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        type = nil
        content = nil
    }
    
    func configure(with infos: TappableInformation) {
        titleLabel.text = infos.type.title
        contentLabel.text = infos.content
        trailingIconLabel.text = infos.type.trailingIcon
        
        self.type = infos.type
        self.content = infos.content
    }
}
