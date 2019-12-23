//
//  ResourcesTableViewCell.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-20.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

class ResourcesTableViewCell: UITableViewCell {
    //
    // MARK: - Outlets
    //
    @IBOutlet weak var titleLabel: UILabel!
    
    //
    // MARK: - Table View Cell
    //
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
    }
}
