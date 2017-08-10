//
//  InformationViewController.swift
//  Test
//
//  Created by Roger Francoeur on 17-08-10.
//  Copyright © 2017 Roger Francoeur. All rights reserved.
//

import UIKit
import MessageUI
import MapKit

class InformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate, AddressTableViewCellDelegate {
    
    var resource : Resource?
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        // Remove separator inset
        tableView.separatorInset = UIEdgeInsets.zero
        
        // Init UI
        let url = URL(string: (resource?.photo)!)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            photoView.image = UIImage(data: imageData)
        }
        titleLabel.text = resource?.title
        descriptionLabel.text = resource?.description?.deleteHTMLTag(tag: "p")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Return the number of rows per section
        switch section{
        case 0:
            return "CONTACT INFORMATIONS"
        case 1:
            return "ADDRESS"
        case 2:
            return "NOTES"
        case 3:
            return "SOCIAL"
        case 4:
            return "BUSINESS HOURS"
        default:
            return ""
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView  {
            //headerView.backgroundView?.backgroundColor?.withAlphaComponent(0)
            headerView.textLabel?.textColor = UIColor.black
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows per section
        switch section{
        case 0:
            return 5
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 7
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.section{
        case 0:
            return 50
        case 1:
            return 70
        case 2:
            return 100
        case 3:
            return 50
        case 4:
            return 30
        default:
            return 50
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell for each section
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! contactTableViewCell
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "PHONE NUMBER"
                cell.subTitleLabel.text = format(phoneNumber: (resource?.contactInfo?.phoneNumber)!)
                cell.contactBtn.setImage(UIImage.init(named: "phone"), for: .normal)
            case 1:
                cell.titleLabel.text = "TOOL-FREE NUMBER"
                cell.subTitleLabel.text = format(phoneNumber: (resource?.contactInfo?.tollFree)!)
                cell.contactBtn.setImage(UIImage.init(named: "phone"), for: .normal)
            case 2:
                cell.titleLabel.text = "FAX NUMBER"
                cell.subTitleLabel.text = format(phoneNumber: (resource?.contactInfo?.faxNumber)!)
                cell.contactBtn.isHidden = true
            case 3:
                cell.titleLabel.text = "EMAIL ADDRESS"
                cell.subTitleLabel.text = resource?.contactInfo?.email
                cell.contactBtn.setImage(UIImage.init(named: "email"), for: .normal)
            case 4:
                cell.titleLabel.text = "WEBSITE"
                cell.subTitleLabel.text = resource?.contactInfo?.website
                cell.contactBtn.setImage(UIImage.init(named: "link"), for: .normal)
            default:
                cell.titleLabel.text = ""
                cell.detailTextLabel?.text = ""
                cell.selectionStyle = .none
            }
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! addressTableViewCell
            
            cell.addressTableViewCellDelegate = self
            
            var address = ""
            
            if let address1 = resource?.addresses?[0].address1 {
                
                let line1 = address1
                let line2 = "\n" + (resource?.addresses?[0].city)! + ", " + (resource?.addresses?[0].state)! + " " + (resource?.addresses?[0].zipCode)!
                let line3 = "\n" + (resource?.addresses?[0].country)!
                address = line1 + line2 + line3
            }

            cell.addressLabel.text = address
            return cell
        }
        else if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! noteTableViewCell
            cell.noteLabel.text = resource?.freeText?.note
            return cell
        }
        else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "socialCell", for: indexPath) as! socialTableViewCell
            cell.facebookBtn.setTitle(resource?.socialMedia?.facebook, for: .normal)
            cell.youTubeBtn.setTitle(resource?.socialMedia?.youtubeChannel, for: .normal)
            cell.twitterBtn.setTitle(resource?.socialMedia?.twitter, for: .normal)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "hourCell", for: indexPath) as! hourTableViewCell
            switch indexPath.row {
            case 0:
                cell.dayLabel.text = "Sunday"
                guard let day =  resource?.bizHours?.sunday else {
                    cell.hourLabel.text = ""
                    break
                }
                cell.hourLabel.text = day.from + "-" + day.to
            case 1:
                cell.dayLabel.text = "Monday"
                guard let day =  resource?.bizHours?.monday else {
                    cell.hourLabel.text = ""
                    break
                }
                cell.hourLabel.text = day.from + "-" + day.to
            case 2:
                cell.dayLabel.text = "Tuesday"
                guard let day =  resource?.bizHours?.tuesday else {
                    cell.hourLabel.text = ""
                    break
                }
                cell.hourLabel.text = day.from + "-" + day.to
            case 3:
                cell.dayLabel.text = "Wednesday"
                guard let day =  resource?.bizHours?.wednesday else {
                    cell.hourLabel.text = ""
                    break
                }
                cell.hourLabel.text = day.from + "-" + day.to
            case 4:
                cell.dayLabel.text = "Thursday"
                guard let day =  resource?.bizHours?.thursday else {
                    cell.hourLabel.text = ""
                    break
                }
                cell.hourLabel.text = day.from + "-" + day.to
            case 5:
                cell.dayLabel.text = "Friday"
                guard let day =  resource?.bizHours?.friday else {
                    cell.hourLabel.text = ""
                    break
                }
                cell.hourLabel.text = day.from + "-" + day.to
            case 6:
                cell.dayLabel.text = "Satursday"
                guard let day =  resource?.bizHours?.satursday else {
                    cell.hourLabel.text = ""
                    break
                }
                cell.hourLabel.text = day.from + "-" + day.to
            default:
                cell.dayLabel.text = ""
                cell.hourLabel.text = ""
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                startCall((resource?.contactInfo?.phoneNumber)!)
            case 1:
                startCall((resource?.contactInfo?.tollFree)!)
            case 3:
                sendEmail((resource?.contactInfo?.email)!)
            case 4:
                openURL((resource?.contactInfo?.website)!)
            default:
                break
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }

    // MARK: - Private
    
    private func openMap(latitude: String, longitude: String, title: String){
        
        guard let lat = Double(latitude) else { return }
        guard let long = Double(latitude) else { return }
        
        let coordinate = CLLocationCoordinate2DMake(lat, long)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = title
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
    private func startCall (_ number: String) {
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
    
    private func format(phoneNumber sourcePhoneNumber: String) -> String? {
        
        // Remove any character that is not a number
        let numbersOnly = sourcePhoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let length = numbersOnly.characters.count
        let hasLeadingOne = numbersOnly.hasPrefix("1")
        
        // Check for supported phone number length
        guard length == 7 || length == 10 || (length == 11 && hasLeadingOne) else {
            return nil
        }
        
        let hasAreaCode = (length >= 10)
        var sourceIndex = 0
        
        // Leading 1
        var leadingOne = ""
        if hasLeadingOne {
            leadingOne = "1 "
            sourceIndex += 1
        }
        
        // Area code
        var areaCode = ""
        if hasAreaCode {
            let areaCodeLength = 3
            guard let areaCodeSubstring = numbersOnly.characters.substring(start: sourceIndex, offsetBy: areaCodeLength) else {
                return nil
            }
            areaCode = String(format: "(%@) ", areaCodeSubstring)
            sourceIndex += areaCodeLength
        }
        
        // Prefix, 3 characters
        let prefixLength = 3
        guard let prefix = numbersOnly.characters.substring(start: sourceIndex, offsetBy: prefixLength) else {
            return nil
        }
        sourceIndex += prefixLength
        
        // Suffix, 4 characters
        let suffixLength = 4
        guard let suffix = numbersOnly.characters.substring(start: sourceIndex, offsetBy: suffixLength) else {
            return nil
        }
        
        return leadingOne + areaCode + prefix + "-" + suffix
    }
    
    private func sendEmail(_ emailAddress: String) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["someone@somewhere.com"])
        mailComposerVC.setSubject("Sending you an e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let alert = UIAlertController(title: "Could Not Send Email", message:"Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in })
        
        self.present(alert, animated: true){}
    }
    
    private func openURL(_ urlString : String){
        
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // MARK: AddressTableViewCellDelegate
    func openMapButtonTap (){
        
        guard let lat = resource?.addresses?[0].location?.latitude else { return }
        guard let long = resource?.addresses?[0].location?.longitude else { return }
        let title = resource?.title
        
        openMap(latitude: lat, longitude: long, title: title!)
    }

}

// MARK: TableViewCell Classes

class contactTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var contactBtn: UIButton!
    
}

class hourTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
}

class addressTableViewCell: UITableViewCell {
    
    var addressTableViewCellDelegate: AddressTableViewCellDelegate?
    
    // MARK: Properties
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBAction func openMapButton(_ sender: UIButton) {
        addressTableViewCellDelegate?.openMapButtonTap()
    }
    
}
protocol AddressTableViewCellDelegate {
    
    func openMapButtonTap()
    
}

class noteTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var noteLabel: UILabel!

}

class socialTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var youTubeBtn: UIButton!
    
    @IBAction func facebookButton(_ sender: UIButton) {
        guard let url = facebookBtn.title(for: .normal) else { return }
        openURL(url)
    }
    
    @IBAction func youTubeButton(_ sender: UIButton) {
        guard let url = youTubeBtn.title(for: .normal) else { return }
        openURL(url)
    }
    
    @IBAction func twitterButton(_ sender: UIButton) {
        guard let url = twitterBtn.title(for: .normal) else { return }
        openURL(url)
    }
    
    private func openURL(_ urlString : String){
        
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
}

