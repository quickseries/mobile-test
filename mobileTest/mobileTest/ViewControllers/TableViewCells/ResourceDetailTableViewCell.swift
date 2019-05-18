//
//  ResourceDetailTableViewCell.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit
import AlamofireImage
import MessageUI.MFMailComposeViewController
import WebBrowser

protocol ResourceDetailTableViewCellDelegate {
  func didTapOnEmail(mailer: MFMailComposeViewController)
  func didTapOnWebLink(web: WebBrowserViewController)
}

class ResourceDetailTableViewCell: UITableViewCell {
  var resource: ResourceModel?
  
  @IBOutlet weak var webLink: UIButton!
  @IBOutlet weak var imgView: UIImageView!
  @IBOutlet weak var phoneNumber: UIButton!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var emailAddress: UIButton!
  @IBOutlet weak var addressBtn: UIButton!
  
  var delegate: ResourceDetailTableViewCellDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  override func prepareForReuse() {
    self.imgView.image = UIImage(named: "imagePlaceholder")
  }
  
  func setUp(data: ResourceModel) {
    data.image.map { self.imgView.af_setImage(withURL: $0) }
    self.titleLabel.text = data.title
    self.descriptionLabel.attributedText = data.description?.htmlToAttributedString
    self.phoneNumber.setTitle(data.contactInfo?.phoneNumbers?.first ?? "NA", for: UIControl.State.normal)
    self.emailAddress.setTitle(data.contactInfo?.emailIds?.first ?? "NA", for: .normal)
    self.webLink.setTitle(data.contactInfo?.websites?.first?.absoluteString ?? "NA", for: .normal)
    self.resource = data
    
    self.addressBtn.titleLabel?.lineBreakMode = .byWordWrapping
    self.addressBtn.titleLabel?.textAlignment = .left
    self.addressBtn.titleLabel?.numberOfLines = 0
    self.addressBtn.setTitle(data.address?.first?.formattedAddress, for: .normal)
  }
  
  @IBAction func phoneNumberClicked(_ sender: Any) {
    guard let number = resource?.contactInfo?.phoneNumbers?.first,
      let numberUrl = URL(string: "tel://" + number) else { return }
    UIApplication.shared.open(numberUrl)
  }
  
  @IBAction func emailBtnClicked(_ sender: Any) {
    guard let emailId = resource?.contactInfo?.emailIds?.first else { return }
    
    let mailer = MFMailComposeViewController()
    mailer.setToRecipients([emailId])
    
    self.delegate?.didTapOnEmail(mailer: mailer)
  }
  
  @IBAction func WeblinkBtnClicked(_ sender: Any) {
    guard let url = resource?.contactInfo?.websites?.first else { return }
    
    let webBrowserViewController = WebBrowserViewController()
    webBrowserViewController.loadURL(url)
    self.delegate?.didTapOnWebLink(web: webBrowserViewController)
  }
  
  @IBAction func addressBtnClicked(_ sender: Any) {
    guard let lat = self.resource?.address?.first?.location.lat,
      let lng = self.resource?.address?.first?.location.lng,
      let googleMapUrl = URL(string:"comgooglemaps://?center=\(lat),\(lng)&zoom=14&views=traffic") else {
        return
    }
    
    let canOpen = UIApplication.shared.canOpenURL(googleMapUrl)
    if canOpen {
      UIApplication.shared.open(googleMapUrl)
    } else {
      ErrorHandler.showErrorAlert(withMessage: "Install google maps")
    }
  }
}
