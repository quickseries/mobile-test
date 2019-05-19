//
//  CategoryTableViewCell.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-19.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    func config(withTitle title: String, description: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}
