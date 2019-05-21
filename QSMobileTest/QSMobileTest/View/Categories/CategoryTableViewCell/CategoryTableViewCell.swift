//
//  TracksTableViewCell.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import UIKit


class CategoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var categoryTitle : UILabel!
    @IBOutlet weak var categoryDescription: UILabel!
    
    
    public var category : Category! {
        didSet {
            self.categoryTitle.text = category.title
            self.categoryDescription.text = category.categoryDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override func prepareForReuse() {
        
    }
}
