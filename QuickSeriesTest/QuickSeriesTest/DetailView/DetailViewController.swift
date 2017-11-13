//
//  DetailViewController.swift
//  QuickSeriesTest
//
//  Created by Mike Bajakian on 2017-11-12.
//  Copyright © 2017 Mike Bajakian. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI
import MapKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var resourceImageView: UIImageView!
    @IBOutlet weak var resourceTitleLabel: UILabel!
    @IBOutlet weak var resourceDescriptionLabel: UILabel!
 
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - globals
    var resourceDetailsDictionary = Dictionary<String, Any>()
    
    //Note: This test App displays only 2 possible sections in a specific order (Contact Info, Addresses)
    //      if a section has no rows to show then section header title is empty and section header height is set to zero
    var sectionRowCountsArray = [0, 0]
    
    var contactSectionRowCount = 0
    var addressSectionRowCount = 0
    
    var contactSectionDataArray = [[String: Any]]()
    var addressSectionDataArray = [[String: Any]]()

    
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAvailableData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - data to display
    func configureAvailableData() {
        
        //image
        setResourceImage()
        
        //title
        setResourceTitle()
        
        //description
        setResourceDescription()
        
        //contact section
        setContactInformationDetails()
        
        //address section
        setAddressesDetails()
    }
    
    func setResourceTitle() {
        if let resourceTitle = resourceDetailsDictionary[KeyValues.titleKeyValue.rawValue] as? String {
            self.navigationItem.title = resourceTitle
            resourceTitleLabel.text = resourceTitle
            resourceDescriptionLabel.text = ""
        }
        else {
            self.navigationItem.title = ViewTitles.details.rawValue
            resourceTitleLabel.text = ""
            resourceTitleLabel.isHidden = true
        }
    }

    
    func setResourceDescription() {
        if let resourceDescription = resourceDetailsDictionary[KeyValues.descriptionKeyValue.rawValue] as? String {
            let resourceDescriptionNoHTML = resourceDescription.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            resourceDescriptionLabel.text = resourceDescriptionNoHTML
        }
        else {
            resourceDescriptionLabel.text = ""
            resourceDescriptionLabel.isHidden = true
        }
    }
    
    
    func setResourceImage() {
        // load the actual image asynchronously
        if let imagePath = resourceDetailsDictionary[KeyValues.photoKeyValue.rawValue] as? String {
            let url = URL(string: imagePath)!
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                if error != nil {
                    //Note: if image loading fails, implement any relevant app UX policy
                    //      current policy: keeps placeholder image
                    print(error!)
                }
                else {
                    DispatchQueue.main.async(execute: {
                        self.resourceImageView.image = UIImage(data: data!)
                    })
                }
            }
            task.resume()
        }
    }
    
    
    func setContactInformationDetails() {
        contactSectionRowCount = 0
        sectionRowCountsArray[detailViewSectionIndexes.contacts.rawValue] = 0
        
        if let resourceContactDetailsDictionary = resourceDetailsDictionary[KeyValues.contactInfoKeyValue.rawValue] as? Dictionary<String, Any> {
            
            // count how many valid websites
            if let resourceContactWebsitesArray = resourceContactDetailsDictionary[KeyValues.websiteKeyValue.rawValue] as? Array<String> {
                for possibleWebsiteString in resourceContactWebsitesArray {
                    if !possibleWebsiteString.isEmpty {
                        contactSectionRowCount += 1
                        let websiteDictionary = [KeyValues.cellTypeKeyValue.rawValue : detailViewCellType.website.rawValue, KeyValues.cellDataKeyValue.rawValue : possibleWebsiteString] as [String : Any]
                        contactSectionDataArray.append(websiteDictionary)
                    }
                }
            }

            // count how many valid emails
            if let resourceContactEmailsArray = resourceContactDetailsDictionary[KeyValues.emailKeyValue.rawValue] as? Array<String> {
                for possibleEmailString in resourceContactEmailsArray {
                    if !possibleEmailString.isEmpty {
                        contactSectionRowCount += 1
                        let emailDictionary = [KeyValues.cellTypeKeyValue.rawValue : detailViewCellType.email.rawValue, KeyValues.cellDataKeyValue.rawValue : possibleEmailString] as [String : Any]
                        contactSectionDataArray.append(emailDictionary)
                    }
                }
            }

            // count how many valid phone numbers
            if let resourceContactPhoneNumbersArray = resourceContactDetailsDictionary[KeyValues.phoneNumberKeyValue.rawValue] as? Array<String> {
                for possiblePhoneNumberString in resourceContactPhoneNumbersArray {
                    if !possiblePhoneNumberString.isEmpty {
                        contactSectionRowCount += 1
                        let phoneNumberDictionary = [KeyValues.cellTypeKeyValue.rawValue : detailViewCellType.phone.rawValue, KeyValues.cellDataKeyValue.rawValue : possiblePhoneNumberString] as [String : Any]
                        contactSectionDataArray.append(phoneNumberDictionary)
                    }
                }
            }
            
            sectionRowCountsArray[detailViewSectionIndexes.contacts.rawValue] = contactSectionRowCount
        }
        else {
            // no contact info found
            sectionRowCountsArray[detailViewSectionIndexes.contacts.rawValue] = 0
        }
    }

    
    
    func setAddressesDetails() {
        addressSectionRowCount = 0
        sectionRowCountsArray[detailViewSectionIndexes.addresses.rawValue] = 0
        
        if let resourceAddressesArray = resourceDetailsDictionary[KeyValues.addressesKeyValue.rawValue] as? Array<Dictionary<String, Any>> {
            
            // count how many valid addresses
            for possibleAddressDictionary in resourceAddressesArray {
                if let address1StringValue = possibleAddressDictionary[KeyValues.address1KeyValue.rawValue] as? String {
                    if !address1StringValue.isEmpty {
                        addressSectionRowCount += 1
                        //build the complete address
                        let completeAddress = getCompleteAddressFrom(addressDictionary: possibleAddressDictionary)
                        let addressDictionary = [KeyValues.cellTypeKeyValue.rawValue : detailViewCellType.address.rawValue, KeyValues.cellDataKeyValue.rawValue : completeAddress] as [String : Any]
                        addressSectionDataArray.append(addressDictionary)
                    }
                }
            }

            sectionRowCountsArray[detailViewSectionIndexes.addresses.rawValue] = addressSectionRowCount
        }
        else {
            // no addresses found
            sectionRowCountsArray[detailViewSectionIndexes.addresses.rawValue] = 0
        }
    }

   
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - tableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionRowCountsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionRowCountsArray[section]
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case detailViewSectionIndexes.contacts.rawValue:
                return sectionRowCountsArray[detailViewSectionIndexes.contacts.rawValue] == 0 ? "" : detailViewSectionTitles.contactsSectionTitle.rawValue
            
            case detailViewSectionIndexes.addresses.rawValue:
                return sectionRowCountsArray[detailViewSectionIndexes.addresses.rawValue] == 0 ? "" : detailViewSectionTitles.addressesSectionTitle.rawValue
            
            default:
                return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
            case detailViewSectionIndexes.contacts.rawValue:
                return sectionRowCountsArray[detailViewSectionIndexes.contacts.rawValue] == 0 ? 0.0 : 44
            
            case detailViewSectionIndexes.addresses.rawValue:
                return sectionRowCountsArray[detailViewSectionIndexes.addresses.rawValue] == 0 ? 0.0 : 44
            
            default:
                return 0.0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.detailViewCellIdentifier.rawValue, for: indexPath) as? DetailViewTableViewCell  else {
            fatalError("DetailViewController: cellForRowAtIndexPath: The dequeued cell is not an instance of DetailViewTableViewCell.")
        }
        
        // prepare a clean cell
        cell.detailTitleLabel.text = ""
        cell.detailValueLabel.text = ""
        cell.detailImageView.image = nil

        // fill the cell according to its section and index
        if indexPath.section == detailViewSectionIndexes.contacts.rawValue {
            let contactDictionary = contactSectionDataArray[indexPath.row]
            cell.detailTitleLabel.text = stringForCellType(cellType: contactDictionary[KeyValues.cellTypeKeyValue.rawValue] as! Int)
            cell.detailValueLabel.text = contactDictionary[KeyValues.cellDataKeyValue.rawValue] as? String
            cell.detailImageView.image = UIImage(named: imageNameForCellType(cellType: contactDictionary[KeyValues.cellTypeKeyValue.rawValue] as! Int))
            cell.cellType = contactDictionary[KeyValues.cellTypeKeyValue.rawValue] as! Int //(phone or email or website)
        }
        else {
            if indexPath.section == detailViewSectionIndexes.addresses.rawValue {
                let addressDictionary = addressSectionDataArray[indexPath.row]
                cell.detailTitleLabel.text = stringForCellType(cellType: addressDictionary[KeyValues.cellTypeKeyValue.rawValue] as! Int)
                cell.detailValueLabel.text = addressDictionary[KeyValues.cellDataKeyValue.rawValue] as? String
                cell.detailImageView.image = UIImage(named: imageNameForCellType(cellType: addressDictionary[KeyValues.cellTypeKeyValue.rawValue] as! Int))
                cell.cellType = detailViewCellType.address.rawValue
            }
        }
        
        return cell
    }
    
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - tableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //deselect the selected row
        tableView.deselectRow(at: indexPath, animated: true)
        
        //check selected row type to determine behaviour
        let selectedCell = tableView.cellForRow(at: indexPath) as! DetailViewTableViewCell
        
        switch selectedCell.cellType {
            //phone
            case detailViewCellType.phone.rawValue:
                if let valueAsPhoneNumber = selectedCell.detailValueLabel.text {
                    doPhoneCallWith(phoneNumber: valueAsPhoneNumber)
                }
                else {
                    showAlertWith(title: "Error!", message: "Could not access phone number!")
                }
            
            //email
            case detailViewCellType.email.rawValue:
                if let valueAsEmailString = selectedCell.detailValueLabel.text {
                    doComposeEmailWith(emailString: valueAsEmailString)
                }
                else {
                    showAlertWith(title: "Error!", message: "Could not access email!")
                }
            
            //website
            case detailViewCellType.website.rawValue:
                if let valueAsURLString = selectedCell.detailValueLabel.text {
                    doOpenBrowserWith(URLString: valueAsURLString)
                }
                else {
                    showAlertWith(title: "Error!", message: "Could not access website URL!")
                }
            
            //address
            case detailViewCellType.address.rawValue:
                if let valueAsAddressString = selectedCell.detailValueLabel.text {
                    doOpenMapsWith(addressString: valueAsAddressString)
                }
                else {
                    showAlertWith(title: "Error!", message: "Could not access address!")
            }
            
            //error or default
            case detailViewCellType.unknown.rawValue:
                fallthrough
            default:
                showAlertWith(title: "Error!", message: "Unknown error. Please contact support!")
        }
    }
   
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - cell actions
    func doOpenBrowserWith(URLString: String) {
        if let url = URL(string: URLString) {
            let safariBrowserViewController = SFSafariViewController(url: url)
            safariBrowserViewController.delegate = self as? SFSafariViewControllerDelegate
            safariBrowserViewController.modalPresentationStyle = .overFullScreen
            present(safariBrowserViewController, animated: true)
        }
        else {
            showAlertWith(title: "Error!", message: "Invalid website URL!")
        }
    }
    
    func doPhoneCallWith(phoneNumber: String) {
        let formattedNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        let phoneNumberURLString = "tel://\(formattedNumber)"
        if let phoneNumberURL = URL(string: phoneNumberURLString) {
            UIApplication.shared.open(phoneNumberURL, options: [:], completionHandler: nil)
        }
        else {
            showAlertWith(title: "Error!", message: "Invalid phone number!")
        }
    }

    func doComposeEmailWith(emailString: String) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposerViewController = MFMailComposeViewController()
            mailComposerViewController.mailComposeDelegate = self
            mailComposerViewController.setToRecipients([emailString])
            present(mailComposerViewController, animated: true)
        }
        else {
            showAlertWith(title: "Error!", message: "Cannot send email. Please check your mail settings.")
        }
    }
    
    func doOpenMapsWith(addressString: String) {
        let baseMapsURLString: String = "http://maps.apple.com/?q="
        let encodedAddressString = addressString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let finalMapsURLString = baseMapsURLString + encodedAddressString
        if let finalMapsURL = URL(string: finalMapsURLString) {
            UIApplication.shared.open(finalMapsURL, options: [:], completionHandler: nil)
        }
        else {
            showAlertWith(title: "Error!", message: "Invalid address!")
        }
    }
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - MailCompose Delegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    //-----------------------------------------------------------------------------------------------------------------
    // MARK: - helper methods
    func showAlertWith(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func stringForCellType(cellType: Int) -> String {
        var returnString = ""
        switch cellType {
            case detailViewCellType.unknown.rawValue:
                returnString = detailViewCellTitles.unkown.rawValue
            case detailViewCellType.phone.rawValue:
                returnString = detailViewCellTitles.phone.rawValue
            case detailViewCellType.email.rawValue:
                returnString = detailViewCellTitles.email.rawValue
            case detailViewCellType.website.rawValue:
                returnString = detailViewCellTitles.website.rawValue
            case detailViewCellType.address.rawValue:
                returnString = detailViewCellTitles.address.rawValue
            default:
                returnString = detailViewCellTitles.unkown.rawValue
        }
        return returnString
    }
    
    
    func imageNameForCellType(cellType: Int) -> String {
        var returnString = ""
        switch cellType {
            case detailViewCellType.unknown.rawValue:
                returnString = imageNames.imageViewPlaceHolder.rawValue
            case detailViewCellType.phone.rawValue:
                returnString = imageNames.phoneLogo.rawValue
            case detailViewCellType.email.rawValue:
                returnString = imageNames.emailLogo.rawValue
            case detailViewCellType.website.rawValue:
                returnString = imageNames.websiteLogo.rawValue
            case detailViewCellType.address.rawValue:
                returnString = imageNames.addressLogo.rawValue
            default:
                returnString = imageNames.imageViewPlaceHolder.rawValue
        }
        return returnString
    }
    
    func getCompleteAddressFrom(addressDictionary: Dictionary<String, Any>) -> String {
        
        var addressLine1 = ""
        var addressLine2 = ""
        var addressLine3 = ""
        var finalAddressString = ""

        
        //line 1
        if let address1 = addressDictionary[KeyValues.address1KeyValue.rawValue] as? String {
            if !address1.isEmpty {
                addressLine1 += address1
            }
        }
        
        //line 1
        if let city = addressDictionary[KeyValues.cityKeyValue.rawValue] as? String {
            if !city.isEmpty {
                addressLine2 += city
            }
        }
        if let state = addressDictionary[KeyValues.stateKeyValue.rawValue] as? String {
            if !state.isEmpty {
                if addressLine2.isEmpty {
                    addressLine2 += state
                }
                else {
                    addressLine2 += ", "
                    addressLine2 += state
                }
            }
        }
        if let zipcode = addressDictionary[KeyValues.zipCodeKeyValue.rawValue] as? String {
            if !zipcode.isEmpty {
                if addressLine2.isEmpty {
                    addressLine2 += zipcode
                }
                else {
                    addressLine2 += " "
                    addressLine2 += zipcode
                }
            }
        }

        //line 3
        if let country = addressDictionary[KeyValues.countryKeyValue.rawValue] as? String {
            if !country.isEmpty {
                addressLine3 += country
            }
        }
        
        if !addressLine1.isEmpty {
            finalAddressString += addressLine1
        }
        
        if !addressLine2.isEmpty {
            finalAddressString += "\n"
            finalAddressString += addressLine2
        }

        if !addressLine3.isEmpty {
            finalAddressString += "\n"
            finalAddressString += addressLine3
        }

        return finalAddressString
    }
}





















