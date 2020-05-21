//
//  CategoryTableViewCell.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var slug: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var eid: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(with category: Category) {
        slug.text = category.slug
        title.text = category.title
        eid.text = category.eid
    }    
}
