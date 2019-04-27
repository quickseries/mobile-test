//
//  ContactInfoCell.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices
class ContactInfoCell: UITableViewCell {
    var containerViewController : UIViewController?
    var contactInfoDetail: ContactInfoDetail?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var rightButton1: UIButton!
    @IBOutlet weak var rightButton2: UIButton!
    @IBAction func rightButton1Action(_ sender: Any) {
        guard let infoDetail = self.contactInfoDetail else {
            return
        }
        switch (infoDetail.type)
        {
        case .email:
            guard let emailAddress = infoDetail.details else{
                return
            }
            let emailTitle = ""
            let messageBody = ""
            let toRecipents = [emailAddress]
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            mc.setMessageBody(messageBody, isHTML: false)
            mc.setToRecipients(toRecipents)
            guard let vc = self.containerViewController else {
                return
            }
            vc.present(mc, animated: true, completion: nil)
            break
        case .faxNumber: break
        case .phoneNumber,.tollFreeNumber:
            guard let phoneNumber = infoDetail.details else{
                return
            }
            if let url = URL(string: "tel://\(phoneNumber)"),
                UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler:nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            } else {
                // add error message here
            }
            
            break
        case .website:
            guard let website = infoDetail.details, let url = URL(string: website) else{
                return
            }
            let svc = SFSafariViewController(url: url)
            guard let vc = self.containerViewController else {
                return
            }
            vc.present(svc, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    @IBAction func rightButton2Action(_ sender: Any) {
        guard let viewModel = self.contactInfoDetail else {
            return
        }
        switch (viewModel.type)
        {
        case .phoneNumber,.tollFreeNumber:
            guard let phoneNumber = viewModel.details else{
                return
            }
            if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController()
                controller.body = ""
                controller.recipients = [phoneNumber]
                controller.messageComposeDelegate = self
                guard let vc = self.containerViewController else {
                    return
                }
                vc.present(controller, animated: true, completion: nil)
            }
            break
            
        default:
            break
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
    
    func configure(pContainerViewController : UIViewController?, pViewModel: ContactInfoCellViewViewModel, pIndex: Int) {
        self.containerViewController = pContainerViewController
        self.contactInfoDetail = pViewModel.getDetail(ForIndex: pIndex)
        guard let infoDetail = self.contactInfoDetail else{
            return
        }
        titleLabel.text = infoDetail.title
        detailsLabel.text = infoDetail.details
        
        if infoDetail.type == .phoneNumber
            || infoDetail.type == .tollFreeNumber{
            rightButton1.isHidden = false
            rightButton2.isHidden = false
            
            rightButton1.setImage(#imageLiteral(resourceName: "call.png"), for: .normal)
            rightButton1.setImage(#imageLiteral(resourceName: "call.png"), for: .selected)
            rightButton2.setImage(#imageLiteral(resourceName: "chat"), for: .normal)
            rightButton2.setImage(#imageLiteral(resourceName: "chat"), for: .selected)
        }
        else if infoDetail.type == .email{
            rightButton1.isHidden = false
            rightButton2.isHidden = true
            
            rightButton1.setImage(#imageLiteral(resourceName: "send"), for: .normal)
            rightButton1.setImage(#imageLiteral(resourceName: "send"), for: .selected)
            
            
        }
        else if infoDetail.type == .website{
            rightButton1.isHidden = false
            rightButton2.isHidden = true
            rightButton1.setImage(#imageLiteral(resourceName: "next"), for: .normal)
            rightButton1.setImage(#imageLiteral(resourceName: "next"), for: .selected)
            
        }
        else if infoDetail.type == .faxNumber{
            rightButton1.isHidden = true
            rightButton2.isHidden = true
            
        }
    }
    
}
extension ContactInfoCell: MFMessageComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        guard let vc = self.containerViewController else {
            return
        }
        vc.dismiss(animated: true, completion: nil)
    }
}

extension ContactInfoCell:MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail cancelled")
        case .saved:
            print("Mail saved")
        case .sent:
            print("Mail sent")
        case .failed:
            print("Mail sent failure: \(error?.localizedDescription ?? "")")
        default:
            break
        }
        
        guard let vc = self.containerViewController else {
            return
        }
        vc.dismiss(animated: true, completion: nil)
    }
    
}
