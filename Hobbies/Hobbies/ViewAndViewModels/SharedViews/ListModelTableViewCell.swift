//
//  CategoryTableViewCell.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit

class ListModelTableViewCell: UITableViewCell
{

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            self.descriptionLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var listModel: ListModelProtocol! {
        didSet
        {
            nameLabel.text = listModel.title
            descriptionLabel.text = listModel.description
            if let dateText = listModel.createdAt?.convert(toStyle: .full) {
                dateLabel.text = "created at: \(dateText)"
            }
        }
    }
}

