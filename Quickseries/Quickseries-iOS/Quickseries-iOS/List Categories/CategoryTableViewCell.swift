//
//  CategoryTableViewCell.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier = "CategoryCellIdentifier"
    
    var viewModel: CategoryCellViewModel? {
        didSet {
            textLabel?.text = viewModel?.title
        }
    }
}
