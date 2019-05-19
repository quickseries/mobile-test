//
//  TitleAndDescTableViewCell.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit

class TitleAndDescTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            self.nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var info: DetailToListModel.Title!{
        didSet {
            self.nameLabel.text = self.info.title
            self.descriptionLabel.text = self.info.description
        }
    }
}
