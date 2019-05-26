//
//  Communication.swift
//  Location
//
//  Created by Nagesh on 26/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation
import MessageUI

class Email: NSObject, MFMailComposeViewControllerDelegate {
    

    func sendEmail(emailID: String, viewController: UIViewController) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([emailID])
            mail.setMessageBody("<p>Test things</p>", isHTML: true)
            
            viewController.present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        print(error.debugDescription)
    }
    
}
