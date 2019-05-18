//
//  CategoryCollectionViewCell.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var category: Category! {
        didSet {
            titleLabel.text = category.title
            descriptionLabel.text = category.description
        }
    }
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: RoundableImageView!

}
