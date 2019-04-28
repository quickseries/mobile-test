//
//  ContactViewController.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/24/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,ContactHandler {
    
    @IBOutlet weak var tblContact:UITableView!
    
    // Should know only about the data that its showing, passing only the contact Object
    var contactObj:ContactInfo?
    {
        didSet
        {
            self.tblContact.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblContact.dequeueReusableCell(withIdentifier: "ids_Contact") as! ContactCell
        cell.delegate = self
        cell.btnCommon.tag = indexPath.row
        cell.btnCommon.setImage(UIImage(named: "Call"), for: .normal)

        if indexPath.row == 0
        {
            cell.setupTable(title: "Phone Number", number: contactObj?.phoneNumber.first ?? "")
            cell.btnText.alpha = 1
        }
        else if indexPath.row == 1
        {
            cell.setupTable(title: "Toll-Free Number", number: contactObj?.tollFree.first ?? "")
            cell.btnText.alpha = 1
        }
        else if indexPath.row == 2
        {
            cell.setupTable(title: "Fax Number", number: contactObj?.faxNumber.first ?? "")
            cell.btnText.alpha = 0
        }
        else if indexPath.row == 3
        {
            cell.setupTable(title: "Email Address", number: contactObj?.email.first ?? "")
            cell.btnCommon.setImage(UIImage(named: "Email"), for: .normal)
            cell.btnText.alpha = 0
        }
        else if indexPath.row == 4
        {
            cell.setupTable(title: "Website", number: contactObj?.website.first ?? "")
            cell.btnCommon.setImage(UIImage(named: "Website"), for: .normal)
            cell.btnText.alpha = 0

        }

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0
        {
            if contactObj?.phoneNumber.first == nil || contactObj?.phoneNumber.first?.isEmpty ?? false
            { return 0 }
        }
        else if indexPath.row == 1
        {
            if contactObj?.tollFree.first == nil || contactObj?.tollFree.first?.isEmpty ?? false
            { return 0 }
        }
        else if indexPath.row == 2
        {
            if contactObj?.faxNumber.first == nil || contactObj?.faxNumber.first?.isEmpty ?? false
            { return 0 }
        }
        else if indexPath.row == 3
        {
            if contactObj?.email.first == nil || contactObj?.email.first?.isEmpty ?? false
            { return 0 }
        }
        else if indexPath.row == 4
        {
            if contactObj?.website.first == nil || contactObj?.website.first?.isEmpty ?? false
            { return 0 }
        }

        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    func makeCall(number: String) {
     
        Common.makeCall(number: number, controller: self)
    }
    func openEmail() {
        emailUser(email: contactObj?.email.first ?? "")
    }
    func openWebsite() {
        Common.openWebView(controller: self, url: contactObj?.website.first ?? "")
    }
    func sendText(number: String) {
        
        sendTextToNumber(number: number)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ContactViewController
{
    func emailUser(email:String)
    {
        
        if(MFMailComposeViewController.canSendMail())
        {
            let emailTitle = "Hi"
            let messageBody = "I have a querry "
            let toRecipents = [email]
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            mc.setMessageBody(messageBody, isHTML: false)
            mc.setToRecipients(toRecipents)
            
            self.present(mc, animated: true, completion: nil)
            
        }
        else
        {
            Common.sendAlert(title: "Error", msg: "Please setup email in your settings",viewController: self)
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .sent:
            Common.sendAlert(title: "Success", msg: "Main Sent",viewController: self)
            break
        case .saved:
            print("Mail sent")
            break
        case .failed:
            Common.sendAlert(title: "Failed", msg: "Failed to send email, please make sure your email is valid",viewController: self)
            break
        default:
            print("random issue")
            break
        }
        controller.dismiss(animated: true)
    }
    func sendTextToNumber(number:String) {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Hi"
            controller.recipients = [number]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
