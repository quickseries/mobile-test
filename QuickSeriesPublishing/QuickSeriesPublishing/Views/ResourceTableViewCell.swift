//
//  ResourceTableViewCell.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit
import Kingfisher

class ResourceTableViewCell: UITableViewCell {
    @IBOutlet weak var slug: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    @IBOutlet weak var resourceImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(with resource: Resource) {
        slug.text = resource.slug
        shortDescription.text = resource.description
        
        if let url = resource.photo {
            resourceImage.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
    
}
