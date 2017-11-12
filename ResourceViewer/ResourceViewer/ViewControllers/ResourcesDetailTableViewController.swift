//
//  ResourcesDetailTableViewController.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit

enum DetailSections {
    case titleDescription
    case contactInfo
    case addresses
    case notes
    case socialMedia
    case busniessHours    
}

class ResourcesDetailTableViewController: UITableViewController {
    
    var viewModel: ResourcesDetailVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 2: // Contact info
            return 5
        case 3: // Addresses
            return viewModel.resource.addresses?.count ?? 0
        case 6: // Business hours
            return 7
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 2: // Contact Info
            return "Contact Information"
        case 3: // Address
            return "Addresses"
        case 4: // Notes
            return "Notes"
        case 5: // Social
            return "Social Media"
        case 6: // Business Hours
            return "Business Hours"
        default:
            return ""
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0: // Photo
            return returnPhotoCell(tableView, for: indexPath)
        case 1: // Contact info
            return returnTitleCell(tableView, for: indexPath)
        case 2: // Contact info
            return returnContactInfoCell(tableView, for: indexPath)
        case 3: // Addresses
            return returnAddressCell(tableView, for: indexPath)
        case 4: // Notes
            return returnNotesCell(tableView, for: indexPath)
        case 5: // Social Media
            return returnSocialMediaCell(tableView, for: indexPath)
        case 6: // Business Hours
            return returnBusniessHourCell(tableView, for: indexPath)
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0: // Photo
            return 200
        case 1: // Contact info
            return 90
        case 2: // Contact info
            return 75
        case 3: // Addresses
            return 150
        case 4: // Notes
            return 100
        case 5: // Social Media
            return 45
        case 6: // Business Hours
            return 45
        default:
            return 50
        }
    }
    
    func returnPhotoCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! ImageTableViewCell
        
        cell.loadPhoto(urlString: viewModel.resource.photo ?? "")
        
        return cell
    }
    
    func returnTitleCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath)
        
        cell.textLabel?.text = viewModel.resource.title
        cell.detailTextLabel?.text = viewModel.resource.description?.html2String
        
        return cell
    }
    
    func returnContactInfoCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactInfoCell", for: indexPath) as! ContactInfoTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.title.text = "PHONE NUMBER"
            if let phone = viewModel.resource.contactInfo?.phoneNumber {
                cell.number.text = "\(phone.first ?? "")"
            }
            else {
                cell.number.text = "N/A"
                cell.callButton.isHidden = true
                cell.messageButton.isHidden = true
            }
            cell.emailButton.isHidden = true
            cell.webSiteButton.isHidden = true
        case 1:
            cell.title.text = "TOLL-FREE NUMBER"
            if let tollFree = viewModel.resource.contactInfo?.tollFree {
                cell.number.text = tollFree.first
            }
            else {
                cell.number.text = "N/A"
                cell.callButton.isHidden = true
                cell.messageButton.isHidden = true
            }
            cell.emailButton.isHidden = true
            cell.webSiteButton.isHidden = true
        case 2:
            cell.title.text = "FAX NUMBER"
            if let fax = viewModel.resource.contactInfo?.faxNumber {
                cell.number.text = fax.first
            }
            cell.messageButton.isHidden = true
            cell.callButton.isHidden = true
            cell.emailButton.isHidden = true
            cell.webSiteButton.isHidden = true
        case 3:
            cell.title.text = "EMAIL ADDRESS"
            if let email = viewModel.resource.contactInfo?.email {
                cell.number.text = email.first
            }
            else {
                cell.number.text = "N/A"
            }
            cell.messageButton.isHidden = true
            cell.callButton.isHidden = true
            cell.webSiteButton.isHidden = true
        case 4:
            cell.title.text = "WEBSITE"
            if let website = viewModel.resource.contactInfo?.website {
                cell.number.text = website.first
            }
            else {
                cell.number.text = "N/A"
            }
            cell.messageButton.isHidden = true
            cell.callButton.isHidden = true
            cell.emailButton.isHidden = true
        default:
            cell.textLabel?.text = ""
        }
        
        
        return cell
    }
    
    func returnAddressCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as! AddressCellTableViewCell
        
        let address = viewModel.resource.addresses![indexPath.row]
        
        cell.address.text = "\(address.address1 ?? "")  \n \(address.city ?? ""), \(address.state ?? ""), \(address.zipCode ?? "") \n \(address.country ?? "")"
        
        return cell
    }
    
    func returnNotesCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        cell.textLabel?.text = "Notes"
        return cell
    }
    
    func returnSocialMediaCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SocialMediaCell", for: indexPath) as! SocialMediaTableViewCell
        
        cell.setSocialMedia(socialMedia: viewModel.resource.socialMedia)
        
        return cell
    }
    
    func returnBusniessHourCell(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusniessHourCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Sunday"
            if let from = viewModel.resource.bizHours?.sunday?.from, let to = viewModel.resource.bizHours?.sunday?.to {
                cell.detailTextLabel?.text = from + " - "  + to
            }
            else {
                cell.detailTextLabel?.text = "N/A"
            }
        case 1:
            cell.textLabel?.text = "Monday"
            if let from = viewModel.resource.bizHours?.monday?.from, let to = viewModel.resource.bizHours?.monday?.to {
                cell.detailTextLabel?.text = from + " - " + to
            }
            else {
                cell.detailTextLabel?.text = "N/A"
            }
        case 2:
            cell.textLabel?.text = "Tuesday"
            if let from = viewModel.resource.bizHours?.tuesday?.from, let to = viewModel.resource.bizHours?.tuesday?.to {
                cell.detailTextLabel?.text = from + " - " + to
            }
            else {
                cell.detailTextLabel?.text = "N/A"
            }
        case 3:
            cell.textLabel?.text = "Wednesday"
            if let from = viewModel.resource.bizHours?.wednesday?.from, let to = viewModel.resource.bizHours?.wednesday?.to {
                cell.detailTextLabel?.text = from + " - " + to
            }
            else {
                cell.detailTextLabel?.text = "N/A"
            }
        case 4:
            cell.textLabel?.text = "Thursday"
            if let from = viewModel.resource.bizHours?.thursday?.from, let to = viewModel.resource.bizHours?.thursday?.to {
                cell.detailTextLabel?.text = from + " - " + to
            }
            else {
                cell.detailTextLabel?.text = "N/A"
            }
        case 5:
            cell.textLabel?.text = "Friday"
            if let from = viewModel.resource.bizHours?.friday?.from, let to = viewModel.resource.bizHours?.friday?.to {
                cell.detailTextLabel?.text = from + " - " + to
            }
            else {
                cell.detailTextLabel?.text = "N/A"
            }
        case 6:
            cell.textLabel?.text = "Saturday"
            if let from = viewModel.resource.bizHours?.saturday?.from, let to = viewModel.resource.bizHours?.saturday?.to {
                cell.detailTextLabel?.text = from + " - " + to
            }
            else {
                cell.detailTextLabel?.text = "N/A"
            }
        default:
            break
        }
        
        return cell
    }    
}
