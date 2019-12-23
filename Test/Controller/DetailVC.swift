//
//  DetailVC.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-21.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit
import MapKit
import SafariServices
import MessageUI

class DetailVC: UITableViewController, MFMailComposeViewControllerDelegate {
    
    var resourceDetail : Resource!
    let detailDataSource = DetailDataSource()
    var titleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = detailDataSource
        loadSectionData()
        detailDataSource.sectionTitle = titleArray
        detailDataSource.resourceDetail = resourceDetail
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if titleArray[indexPath.section] == "" {
            return 200
        }
        else if titleArray[indexPath.section] == DetailPageType.address.rawValue {
            return 120
        }
        return 70
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForView(text: titleArray[section], width: tableView.frame.width)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let height = heightForView(text: titleArray[section], width: tableView.frame.width)
        let vw = UITableViewHeaderFooterView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: height))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: vw.frame.width-10, height: vw.frame.height-10)
        label.textColor = UIColor.black
        label.text = titleArray[section]
        label.numberOfLines = 0
        if titleArray[section] != resourceDetail.desc {
            label.font = UIFont.boldSystemFont(ofSize: 20.0)
        }
        vw.addSubview(label)
        return vw
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if detailDataSource.contactDetail.count > 0 && titleArray[indexPath.section] == DetailPageType.contactInfo.rawValue {
            
            let cell = tableView.cellForRow(at: indexPath) as! PhoneNumberTableViewCell
            dialButtonClicked(cell)
        } else if detailDataSource.resourceDetail.locations != nil && titleArray[indexPath.section] == DetailPageType.address.rawValue {
            
            let cell = tableView.cellForRow(at: indexPath) as! AddressTableViewCell
            mapButtonClicked(cell)
        }
    }
}

extension DetailVC {
    
    @objc func mapButtonClicked(_ cell : AddressTableViewCell) {

        let address = cell.addressLabel.text
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address!) { (placemarks, error) in
            guard
                let placemark = placemarks?.first
                else {
                    return
            }
            let regionDistance:CLLocationDistance = 10000
            let lat = placemark.location?.coordinate.latitude
            let lon = placemark.location?.coordinate.longitude
            let coordinates = CLLocationCoordinate2DMake(lat!, lon!)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let mark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: mark)
            mapItem.name = address!
            mapItem.openInMaps(launchOptions: options)
        }
    }

    func dialButtonClicked(_ cell : PhoneNumberTableViewCell) {
        
        let phoneNumber = cell.numberLabel.text
        let buttonImage = cell.numberButton.currentImage
        
        if buttonImage == UIImage(named: "call") {
            if let phoneCallURL = URL(string: "tel://\(phoneNumber!)") {
                
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(phoneCallURL)) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                }
            }
        }
        else if buttonImage == UIImage(named: "email") {
            let mailComposeViewController = configuredMailComposeViewController(phoneNumber!)
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
        }
        else {
            let svc = SFSafariViewController(url: URL(string: phoneNumber!)!)
            self.present(svc, animated: true, completion: nil)
        }
    }

    func configuredMailComposeViewController(_ mailId: String) -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([mailId])
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send Email.  Please check Email configuration and try again.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        sendMailErrorAlert.addAction(action)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller:MFMailComposeViewController, didFinishWithResult:MFMailComposeResult, error:Error?) {

        switch didFinishWithResult {
            
        case .cancelled:
            print("Mail cancelled")
            break
        case .saved:
            print("Mail saved")
            break
        case .sent:
            print("Mail sent")
            break
        case .failed:
            break
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    private func loadSectionData() {
        
        titleArray.append("")
        titleArray.append(resourceDetail.title)
        titleArray.append(resourceDetail.desc.html2String)

        configureContact()
        
        if detailDataSource.contactDetail.count > 0 {
            titleArray.append(DetailPageType.contactInfo.rawValue)
        }
        
        resourceDetail.locations?.forEach({ (location) in
            if location.address != nil {
                titleArray.append(DetailPageType.address.rawValue)
            }
        })

        if resourceDetail.socialMedia != nil {
            titleArray.append(DetailPageType.socialMedia.rawValue)
        }
        if resourceDetail.businessHours != nil {
            titleArray.append(DetailPageType.businessHours.rawValue)
        }
    }
    
    fileprivate func configureContact() {
        
        for contact in resourceDetail.contactInfo {
            var contactDict = [String: String]()
            if let email = contact.email {
                contactDict[Contact.email.rawValue] = email
                removeDictionaryData(contactDict: &contactDict)
            }
            if let website = contact.webSite {
                contactDict[Contact.website.rawValue] = website
                removeDictionaryData(contactDict: &contactDict)
            }
            if let faxnumber = contact.faxNumber {
                contactDict[Contact.faxNumber.rawValue] = faxnumber
                removeDictionaryData(contactDict: &contactDict)
            }
            if let tollfreenumber = contact.tollFreeNumber {
                contactDict[Contact.tollFreeNumber.rawValue] = tollfreenumber
                removeDictionaryData(contactDict: &contactDict)
            }
            if let phonenumber = contact.phoneNumber {
                contactDict[Contact.phoneNumber.rawValue] = phonenumber
                removeDictionaryData(contactDict: &contactDict)
            }
        }
    }

    fileprivate func removeDictionaryData(contactDict : inout [String: String]) {
        detailDataSource.contactDetail.append(contactDict)
        contactDict.removeAll()
    }
    
    func heightForView(text:String, width:CGFloat) -> CGFloat {

        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }
}

extension String {
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        return html
    }
    
    var html2String: String {
        return htmlAttributedString()?.string ?? ""
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
