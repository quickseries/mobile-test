//
//  MailComposer.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-13.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import MessageUI

class MailComposerView: UIViewController {
 
    func openMailComposeViewController() {
      
        guard MFMailComposeViewController.canSendMail() else {
            print("Can`t send mail")
            return
        }
        
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setPreferredSendingEmailAddress("user@mail.com")
        mail.setSubject("Subject")
        mail.setToRecipients(["recipient@mail.de"])
        mail.setCcRecipients(["ccRecipient@mail.de"])
        mail.setBccRecipients(["bccRecipient@mail.de"])
        mail.setMessageBody("<p>This is the mail's body text!</p>", isHTML: true)
        mail.addAttachmentData(Data(), mimeType: "", fileName: "")
        
        present(mail, animated: true)
    }
}

extension MailComposerView: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        switch result {
        case .cancelled: break
        case .failed: break
        case .saved: break
        case .sent: break
        @unknown default:
            fatalError()
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
