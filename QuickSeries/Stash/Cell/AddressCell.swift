//
//  AddressCell.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/27/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit

protocol OpenMaps {
    
    func takeUserToMaps(gps:GPS)
}

class AddressCell: UITableViewCell {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblMainAddress:UILabel!
    @IBOutlet weak var lblCityZip:UILabel!
    @IBOutlet weak var lblCountry:UILabel!
    @IBOutlet weak var btnMap:UIButton!

    var delegate:OpenMaps?
    var cordinates:GPS?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // #Rem - replace with custom object later on
    func setupName(addressObj:Address)
    {
        lblTitle.text = addressObj.label
        lblMainAddress.text = addressObj.address1
        lblCityZip.text = addressObj.city + " " + addressObj.zipCode
        lblCountry.text = addressObj.country
        cordinates = addressObj.gps
      
        guard let lat = cordinates?.latitude, let long = cordinates?.longitude
        else {
            btnMap.alpha = 0
            return
        }
        
        btnMap.alpha = 1
    }
    
    @IBAction func showMeMap(sender:UIButton)
    {
        self.delegate?.takeUserToMaps(gps:cordinates!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
