//
//  AddressCellTableViewCell.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit
import CoreLocation

class AddressCellTableViewCell: UITableViewCell {

    @IBOutlet weak var address: UITextView!
    
    @IBAction func openAddressInMap() {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(self.address.text) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let _ = placemarks.first?.location
                else {
                    return
            }
            
            if let location = placemarks.first?.location {
                let query = "?ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
                let path = "http://maps.apple.com/" + query
                if let url = NSURL(string: path) {
                    UIApplication.shared.open(url as URL)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
