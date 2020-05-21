//
//  ResourceCell.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-20.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit
//import AlamofireImage

class ResourceCell: UITableViewCell {
	@IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var resourceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
		imageView?.contentMode = .scaleAspectFill
    }
}
