//
//  CategoryCell.swift
//  Mobile Test
//
//  Created by Alecu Truica on 5/18/19.
//  Copyright © 2019 Alecu Truica. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var resourcesCellButton: UIButton!
    @IBOutlet weak var titleCellTextView: UITextView!
    
    var categoryToDisplay = Category(id: "", updatedAt:"", slug: "", customModuleEid: "", eid: "", title: "", description: "", _v: 0, active: false, createdAt: "") {
        didSet {
            if categoryToDisplay.title != "" {
                titleCellTextView.text = categoryToDisplay.title
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
}
