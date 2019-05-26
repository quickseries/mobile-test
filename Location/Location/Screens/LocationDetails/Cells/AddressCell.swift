//
//  AddressCell.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttionAction(_ sender: Any) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
