//
//  ResourceTableViewCell.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import UIKit


class ResourceTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var resourceTitle : UILabel!
    
    
    public var resource : Resource! {
        didSet {
            self.resourceTitle.text = resource.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override func prepareForReuse() {
        
    }
}
