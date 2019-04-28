//
//  ContactCell.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit

protocol ContactHandler {
    
    func openEmail()
    func openWebsite()

    func makeCall(number:String)
    func sendText(number:String)
}

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var lbl_contactTitle:UILabel!
    @IBOutlet weak var lbl_contactNumber:UILabel!
    @IBOutlet weak var btnText:UIButton!
    @IBOutlet weak var btnCommon:UIButton!

    var delegate:ContactHandler?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupTable(title:String,number:String)
    {
        lbl_contactTitle.text = title
        lbl_contactNumber.text = number
    }
    @IBAction func makeActionOnTag(sender:UIButton)
    {
        switch sender.tag {
        case 0:
            delegate?.makeCall(number: lbl_contactNumber.text!)
            break
        case 1:
            delegate?.makeCall(number: lbl_contactNumber.text!)
            break;
        case 3:
            delegate?.openEmail()
            break;
        case 4:
            delegate?.openWebsite()
            break
        default:
            return
        }
    }
    @IBAction func sendText(sender:UIButton)
    {
        delegate?.sendText(number: lbl_contactNumber.text!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
