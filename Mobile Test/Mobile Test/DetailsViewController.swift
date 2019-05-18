//
//  DetailsViewController.swift
//  Mobile Test
//
//  Created by Alecu Truica on 5/18/19.
//  Copyright © 2019 Alecu Truica. All rights reserved.
//

import UIKit
import WebKit
import MessageUI
import MapKit
import CoreLocation

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var browserView: UIView!
    @IBOutlet weak var browserViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var closeWebViewButton: UIButton!
    @IBOutlet weak var coverButton: UIButton!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var resourcePhotoImageView: UIImageView!
    @IBOutlet weak var resourcePhotoImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var resourceTitleLabel: UILabel!
    @IBOutlet weak var resourceTitleLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var resourceDescriptionTextView: UITextView!
    @IBOutlet weak var resourceDescriptionTextViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contactInformationLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var contactInformationTableView: UITableView!
    @IBOutlet weak var contactInformationTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var addressLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var addressTableView: UITableView!
    @IBOutlet weak var addressTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var socialMediaLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var businessHoursLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var businessHoursTableView: UITableView!
    @IBOutlet weak var businessHoursTableViewHeight: NSLayoutConstraint!
    var detailedResource = Resource(id: "", slug: "", eid: "", title: "", description: "", bizHours: nil, categoryEid: "", _v: 0, photoURL: "", active: false, updatedAt: "", createdAt: "", addresses: nil, contactInfo: nil, socialMedia: nil)
    var contactInformation = [(String, String)]()
    var addresses = [String]()
    var businessHours = [(String, String)]()
    var facebook = ""
    var twitter = ""
    var youtube = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let photoURL = URL(string: detailedResource.photoURL) else {
            print("invalid resource photo url")
            return
        }
        URLSession.shared.dataTask(with: photoURL) { (data, response, error) in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self.resourcePhotoImageView.image = UIImage(data: data)
                }
            }
            }.resume()
        
        resourceTitleLabel.text = detailedResource.title
        let data = Data(detailedResource.description.utf8)
        if let attributedDescription = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            DispatchQueue.main.async {
                self.resourceDescriptionTextView.text = attributedDescription.string
            }
        }
        
        contactInformationTableView.dataSource = self
        contactInformationTableView.delegate = self
        addressTableView.dataSource = self
        addressTableView.delegate = self
        businessHoursTableView.dataSource = self
        businessHoursTableView.delegate = self
        
        if detailedResource.contactInfo != nil {
            if detailedResource.contactInfo!.phoneNumber != nil {
                if detailedResource.contactInfo!.phoneNumber!.count > 0 {
                    if detailedResource.contactInfo!.phoneNumber![0] != "" {
                        for phoneNumber in detailedResource.contactInfo!.phoneNumber! {
                            contactInformation.append(("PHONE NUMBER", phoneNumber))
                        }
                    }
                }
            }
            if detailedResource.contactInfo!.faxNumber != nil {
                if detailedResource.contactInfo!.faxNumber!.count > 0 {
                    if detailedResource.contactInfo!.faxNumber![0] != "" {
                        for phoneNumber in detailedResource.contactInfo!.faxNumber! {
                            contactInformation.append(("FAX NUMBER", phoneNumber))
                        }
                    }
                }
            }
            if detailedResource.contactInfo!.tollFree != nil {
                if detailedResource.contactInfo!.tollFree!.count > 0 {
                    if detailedResource.contactInfo!.tollFree![0] != "" {
                        for phoneNumber in detailedResource.contactInfo!.tollFree! {
                            contactInformation.append(("TOLL-FREE NUMBER", phoneNumber))
                        }
                    }
                }
            }
            if detailedResource.contactInfo!.email != nil {
                if detailedResource.contactInfo!.email!.count > 0 {
                    if detailedResource.contactInfo!.email![0] != "" {
                        for emailAddress in detailedResource.contactInfo!.email! {
                            contactInformation.append(("EMAIL ADDRESS", emailAddress))
                        }
                    }
                }
            }
            if detailedResource.contactInfo!.website != nil {
                if detailedResource.contactInfo!.website!.count > 0 {
                    if detailedResource.contactInfo!.website![0] != "" {
                        for websiteAddress in detailedResource.contactInfo!.website! {
                            contactInformation.append(("WEBSITE", websiteAddress))
                        }
                    }
                }
            }
        }
        
        if detailedResource.addresses != nil {
            if detailedResource.addresses![0].address1 != nil {
                addresses.append("\(detailedResource.addresses![0].address1!) \n\(detailedResource.addresses![0].city!), \(detailedResource.addresses![0].state!) \(detailedResource.addresses![0].zipCode!) \n\(detailedResource.addresses![0].country!)")
            }
        }
        
        if detailedResource.socialMedia != nil {
            if detailedResource.socialMedia!.facebook != nil {
                if detailedResource.socialMedia!.facebook![0] != "" {
                    self.facebookButton.isEnabled = true
                    facebook = detailedResource.socialMedia!.facebook![0]
                }
            }
            if detailedResource.socialMedia!.twitter != nil {
                if detailedResource.socialMedia!.twitter![0] != "" {
                    self.twitterButton.isEnabled = true
                    twitter = detailedResource.socialMedia!.twitter![0]
                }
            }
            if detailedResource.socialMedia!.youtubeChannel != nil {
                if detailedResource.socialMedia!.youtubeChannel![0] != "" {
                    self.youtubeButton.isEnabled = true
                    youtube = detailedResource.socialMedia!.youtubeChannel![0]
                }
            }
        }
        calculateScrollViewHeight()
    }
    
    func calculateScrollViewHeight() {
        contactInformationTableView.reloadData()
        addressTableView.reloadData()
        //print("address table view content height", addressTableView.contentSize.height)
        businessHoursTableView.reloadData()
        contactInformationTableViewHeight.constant = contactInformationTableView.contentSize.height
        addressTableViewHeight.constant = addressTableView.contentSize.height
        businessHoursTableViewHeight.constant = businessHoursTableView.contentSize.height
        resourceDescriptionTextViewHeight.constant = resourceDescriptionTextView.contentSize.height
        let newHeight = resourcePhotoImageViewHeight.constant + resourceTitleLabelHeight.constant +  resourceDescriptionTextViewHeight.constant + contactInformationLabelHeight.constant + 52 + contactInformationTableViewHeight.constant
        print(newHeight)
        mainScrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: newHeight)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == contactInformationTableView {
            return contactInformation.count
        } else if tableView == addressTableView {
            return addresses.count
        }
        return businessHours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == contactInformationTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactInfoCell") as! ContactInfoCell
            cell.infoLabel.text = contactInformation[indexPath.row].1
            cell.typeLabel.text = contactInformation[indexPath.row].0
            switch contactInformation[indexPath.row].0 {
            case "EMAIL ADDRESS":
                cell.actionButton.setTitle("Write", for: .normal)
            case "WEBSITE":
                cell.actionButton.setTitle("Go", for: .normal)
            default:
                cell.actionButton.setTitle("Call", for: .normal)
                if contactInformation[indexPath.row].0.contains("FAX") {
                    cell.actionButton.isEnabled = false
                }
            }
            cell.actionButton.accessibilityHint = "\(contactInformation[indexPath.row].0)  -  \(contactInformation[indexPath.row].1)"
            cell.actionButton.addTarget(self, action: #selector(contactInfoActionButtonTapped(sender:)), for: .touchUpInside)
            return cell
        } else if tableView == addressTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell") as! AddressCell
            cell.typeLabel.text = "ADDRESS"
            cell.infoLabel.text = addresses[indexPath.row]
            cell.sizeToFit()
            cell.actionButton.setTitle("Map", for: .normal)
            cell.actionButton.accessibilityHint = addresses[indexPath.row]
            cell.actionButton.addTarget(self, action: #selector(addressActionButtonTapped(sender:)), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "businessHoursCell") as! BusinessHoursCell
            return cell
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func closeWebViewButtonTapped(_ sender: UIButton) {
        browserViewConstraint.constant = -2100
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
        mainScrollView.isUserInteractionEnabled = true
        coverButton.isHidden = true
    }
    
    @IBAction func facebookButtonTapped(_ sender: UIButton) {
        browserViewConstraint.constant = -700
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        if let url = URL(string: facebook) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        mainScrollView.isUserInteractionEnabled = false
        coverButton.isHidden = false
    }
    
    @IBAction func twitterButtonTapped(_ sender: UIButton) {
        browserViewConstraint.constant = -700
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        if let url = URL(string: twitter) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        mainScrollView.isUserInteractionEnabled = false
        coverButton.isHidden = false
    }
    
    @IBAction func youtubeButtonTapped(_ sender: UIButton) {
        browserViewConstraint.constant = -700
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        if let url = URL(string: youtube) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        mainScrollView.isUserInteractionEnabled = false
        coverButton.isHidden = false
    }
    
    @IBAction func contactInfoActionButtonTapped(sender: UIButton) {
        let cellInfo = sender.accessibilityHint?.components(separatedBy: "  -  ")
        let cellContent = cellInfo![1]
        
        if sender.titleLabel?.text == "Call" {
            // make a call
            guard let phoneNumber = URL(string: "tel://\(cellContent)") else {
                print("wrong phone number, you introduced ", cellContent)
                return
            }
            UIApplication.shared.open(phoneNumber)
        } else if sender.titleLabel?.text == "Go" {
            // go to site inside browserView
            browserViewConstraint.constant = -700
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            if let url = URL(string: cellContent) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
            coverButton.isHidden = false
        } else {
            // bring forth emailCompositionView
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
            mailComposerVC.setToRecipients([cellContent])
            mailComposerVC.setMessageBody("Sent from my iPhone", isHTML: false)
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposerVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func addressActionButtonTapped(sender: UIButton) {
        let address = sender.accessibilityHint
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address!) { (placemarks, error) in
            guard let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    return
            }
            let latitude: CLLocationDegrees = location.coordinate.latitude
            let longitude: CLLocationDegrees = location.coordinate.longitude
            
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            
            let placemark = MKPlacemark(coordinate: coordinates)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = self.detailedResource.title
            mapItem.openInMaps(launchOptions: [:])
        }
    }
}
