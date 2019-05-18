//
//  ContactInfoCell.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-18.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import MessageUI

class ContactInfoCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var sendMessageButton: UIButton!
  @IBOutlet weak var callButton: UIButton!
  @IBOutlet weak var openWebButton: UIButton!
  @IBOutlet weak var sendEmailButton: UIButton!
  
  let mc: MFMailComposeViewController = MFMailComposeViewController()

  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  
  private func setupUI() {
    titleLabel.font = Font(.installed(.MontserratBold), size: .standard(.h4)).instance
    contentLabel.font = Font(.installed(.MontserratMedium), size: .standard(.h4)).instance
    titleLabel.textColor = NamedColor.beautifulRed.value
    contentLabel.textColor = NamedColor.lightText.value
  }
  func bind(_ viewmodel: ContactInfoItem) {
    titleLabel.text = viewmodel.title
    contentLabel.text = viewmodel.content
    switch viewmodel.type {
    case .website:
      sendMessageButton.isHidden = true
      callButton.isHidden = true
      openWebButton.isHidden = false
      sendEmailButton.isHidden = true
    case .email:
      sendMessageButton.isHidden = true
      callButton.isHidden = true
      openWebButton.isHidden = true
      sendEmailButton.isHidden = false
    case .phoneNumber:
      sendMessageButton.isHidden = false
      callButton.isHidden = false
      openWebButton.isHidden = true
      sendEmailButton.isHidden = true
      contentLabel.text = "+" + viewmodel.content
    case .fax:
      sendMessageButton.isHidden = true
      callButton.isHidden = true
      openWebButton.isHidden = true
      sendEmailButton.isHidden = true
    case .tollFree:
      sendMessageButton.isHidden = false
      callButton.isHidden = false
      openWebButton.isHidden = true
      sendEmailButton.isHidden = true
    }
  }
  @IBAction func sendMessageButtonPressed(_ sender: UIButton) {
    
  }
  @IBAction func callButtonPressed(_ sender: UIButton) {
    let text = "tel://\(contentLabel.text ?? "")"
    openUrl(text)
  }
  @IBAction func openWebButtonPressed(_ sender: UIButton) {
    let webView = WkWebViewController()
    let text = contentLabel.text ?? ""
    webView.Url = text
    if let topVC = UIApplication.topViewController() {
      topVC.present(webView, animated: true, completion: nil)
    }
  }
  @IBAction func sendEmailButtonPressed(_ sender: UIButton) {
    let toRecipents = [contentLabel.text ?? ""]
    mc.mailComposeDelegate = self
    mc.setToRecipients(toRecipents)
    if let topVC = UIApplication.topViewController() {
      topVC.present(mc, animated: true, completion: nil)
    }
  }
  func openUrl(_ urlString: String) {
    if let url = URL(string: urlString) {
      if #available(iOS 10.0, *) {
        UIApplication.shared.open(url)
      } else {
        UIApplication.shared.openURL(url)
      }
    }
  }
}

extension ContactInfoCell: MFMailComposeViewControllerDelegate {
  private func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError) {
    DispatchQueue.main.async {
      self.mc.dismiss(animated: true, completion: nil)
      self.mc.dismiss(animated: true, completion: nil)
      controller.dismiss(animated: true, completion: nil)
    }
  }
}
