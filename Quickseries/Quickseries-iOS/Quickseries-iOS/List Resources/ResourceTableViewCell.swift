//
//  ResourceTableViewCell.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit

class ResourceTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    var model: ResourceCellViewModel? {
        didSet {
            self.textLabel?.text = model?.title
        }
    }
}
