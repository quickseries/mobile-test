//
//  ResourceDetailTableViewCell.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit
import AlamofireImage

class ResourceDetailTableViewCell: UITableViewCell {
  var resource: ResourceModel?
  
  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var phoneNumber: UIButton!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func setUp(data: ResourceModel) {
    data.image.map { self.imgView.af_setImage(withURL: $0) }
    self.titleLabel.text = data.title
    self.descriptionLabel.attributedText = data.description?.htmlToAttributedString
    self.phoneNumber.setTitle(data.contactInfo?.phoneNumbers?.first ?? "NA", for: UIControl.State.normal)
  }
  
  @IBAction func phoneNumberClicked(_ sender: Any) {
  }
}
