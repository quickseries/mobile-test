//
//  ResourcesViewController.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class ResourcesViewController: UIViewController{
    
    
    var dataSource:Any?
    var dataSections:[String] = []
    var resourceHeaderView = ResourceHeaderView(frame: .zero)
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.CellResources)
        tableView.register(BusinessHoursTableViewCell.self, forCellReuseIdentifier: Constants.CellBusinessHours)
        tableView.register(ContactInfoTableViewCell.self, forCellReuseIdentifier: Constants.CellContactInfo)
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 100.0
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        self.title = "Details"
        view.updateConstraintsIfNeeded()
        tableView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        view.addSubview(resourceHeaderView)
        tableView.tableHeaderView = resourceHeaderView
        view.backgroundColor = .white
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        resourceHeaderView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        tableView.layoutTableHeaderView()
    }
    
    func setupDataSource(){
        if dataSource is Restaurant{
            guard let restaurant = (dataSource as? Restaurant) else {
                return
            }
            
            if let contacts = restaurant.contactInfo?.allContacts{
                if !contacts.isEmpty {
                    dataSections.append(Constants.ContactInfo)
                }
            }
            
            if let addresses = restaurant.addresses{
                if !addresses.isEmpty{
                    dataSections.append(Constants.Addresses)
                }
            }
            
            if let socialMedia = restaurant.socialMedia?.allSocialMedia{
                if !socialMedia.isEmpty{
                    dataSections.append(Constants.SocialMedia)
                }
            }
            
            if let hours = restaurant.bizHours?.days{
                if !hours.isEmpty{
                    dataSections.append(Constants.BusinessHours)
                }
            }
            
            if let photoString = restaurant.photo {
                if let url = URL(string: photoString){
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        guard let data = data, let image = UIImage(data: data) else {
                            print("data not available")
                            return
                        }
                        self.resourceHeaderView.resourceImageView.image = image
                        
                        }.resume()
                }
            }
            
            if let title = restaurant.title {
                self.resourceHeaderView.resourceTitle.text = title
            }
            
            if let description = restaurant.categoryDescription {
                let cleanedDescription = description.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                self.resourceHeaderView.resourceDescription.text = cleanedDescription
            }
            
        } else if dataSource is VacationSpot{
            
            guard let vacationSpot = (dataSource as? VacationSpot) else {
                return
            }
            
            if let contacts = vacationSpot.contactInfo?.allContacts{
                if !contacts.isEmpty {
                    dataSections.append(Constants.ContactInfo)
                }
            }
            
            if let addresses = vacationSpot.addresses{
                if !addresses.isEmpty{
                    dataSections.append(Constants.Addresses)
                }
            }
            
            if let socialMedia = vacationSpot.socialMedia?.allSocialMedia{
                if !socialMedia.isEmpty{
                    dataSections.append(Constants.SocialMedia)
                }
            }
            
            if let photoString = vacationSpot.photo {
                if let url = URL(string: photoString){
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        guard let data = data, let image = UIImage(data: data) else {
                            print("data not available")
                            return
                        }
                        self.resourceHeaderView.resourceImageView.image = image
                        
                        }.resume()
                }
            }
            
            if let title = vacationSpot.title {
                self.resourceHeaderView.resourceTitle.text = title
            }
        }
    }
}

extension ResourcesViewController: UITableViewDataSource, ContactInfoTableViewCellProtocol, MFMailComposeViewControllerDelegate {
    
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if dataSource is Restaurant{
            guard let restaurant = dataSource as? Restaurant else {
                return 0
            }
            switch(dataSections[section]){
            case Constants.Addresses:
                return (restaurant.addresses?.count)!
            case Constants.ContactInfo:
                return (restaurant.contactInfo?.allContacts.count)!
            case Constants.BusinessHours:
                return (restaurant.bizHours?.days.count)!
            case Constants.SocialMedia:
                return (restaurant.socialMedia?.allSocialMedia.count)!
            default:
                return 0
            }
        } else if dataSource is VacationSpot{
            guard let vacationSpot = dataSource as? VacationSpot else {
                return 0
            }
            switch(dataSections[section]){
            case Constants.Addresses:
                return (vacationSpot.addresses?.count)!
            case Constants.ContactInfo:
                return (vacationSpot.contactInfo?.allContacts.count)!
            case Constants.SocialMedia:
                return (vacationSpot.socialMedia?.allSocialMedia.count)!
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellResources, for: indexPath)
        
        let section = dataSections[indexPath.section]
        
        switch section {
        case Constants.Addresses:
            var cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellContactInfo, for: indexPath) as? ContactInfoTableViewCell
            
            if cell == nil {
                cell = ContactInfoTableViewCell(style: .default, reuseIdentifier: Constants.CellContactInfo)
            }
            cell?.selectionStyle = .none

            if dataSource is Restaurant{
                let address = (dataSource as! Restaurant).addresses?[indexPath.row]
                cell?.titleLabel.text = "ADDRESS"
                if let restAddress = address?.address1, let city = address?.city, let state = address?.state, let zip = address?.zipCode, let country = address?.country {
                    cell?.detailsLabel.text = "\(restAddress)\n\(city), \(state) \(zip)\n\(country)"
                }
                cell?.setupAddress()
                cell?.delegate = self
                
                return cell!
            }
        case Constants.ContactInfo:
            var cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellContactInfo, for: indexPath) as? ContactInfoTableViewCell
            
            if cell == nil {
                cell = ContactInfoTableViewCell(style: .default, reuseIdentifier: Constants.CellContactInfo)
            }
            cell?.selectionStyle = .none
            
            if dataSource is Restaurant{
                let contact = (dataSource as! Restaurant).contactInfo?.allContacts[indexPath.row]
                
                if let method = contact?.method{
                    cell?.setupButton(type: ContactInfoFields(rawValue: method)!)
                }
                cell?.detailsLabel.text = contact?.details
                cell?.titleLabel.text = contact?.niceName
                cell?.delegate = self
                
                
            } else {
                let contact = (dataSource as! VacationSpot).contactInfo?.allContacts[indexPath.row]
                if let method = contact?.method{
                    cell?.setupButton(type: ContactInfoFields(rawValue: method)!)
                }
                cell?.detailsLabel.text = contact?.details
                cell?.titleLabel.text = contact?.niceName
                cell?.delegate = self
            }
            
            return cell!
        case Constants.SocialMedia:
            if dataSource is Restaurant{
                let social = (dataSource as! Restaurant).socialMedia?.allSocialMedia[indexPath.row]
                cell.textLabel?.text = social?.details
            } else {
                let social = (dataSource as! VacationSpot).socialMedia?.allSocialMedia[indexPath.row]
                cell.textLabel?.text = social?.details
            }
        case Constants.BusinessHours:
            var cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellBusinessHours, for: indexPath) as? BusinessHoursTableViewCell
            
            if cell == nil {
                cell = BusinessHoursTableViewCell(style: .default, reuseIdentifier: Constants.CellBusinessHours)
            }
            cell?.selectionStyle = .none
            if dataSource is Restaurant{

                let bizHour = (dataSource as! Restaurant).bizHours?.days[indexPath.row]
                cell?.dayLabel.text = bizHour?.day.capitalized
                if let from = bizHour?.from, let to = bizHour?.to{
                    cell?.timeLabel.text = "\(from) - \(to)"
                }
                return cell!
            }
        default:
            return cell
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    //MARK: ContactInfoTableViewCellProtocol
    
    func openMaps(address: String) {
        let baseUrl: String = "http://maps.apple.com/?q="
        let encodedName = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let finalUrl = baseUrl + encodedName
        if let url = URL(string: finalUrl) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func openEmail(email: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            present(mail, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Unable to Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            })
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func openWebBrowser(browser: String) {
        let svc = SFSafariViewController(url: NSURL(string: browser)! as URL)
        present(svc, animated: true, completion: nil)
    }
    func openPhone(phone: String) {
        if let phoneCallURL:URL = URL(string: "tel:\(phone)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                let alertController = UIAlertController(title: "Calling", message: "Are you sure you want to call \n\(phone)?", preferredStyle: .alert)
                let yesPressed = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                    UIApplication.shared.open(phoneCallURL)
                })
                let noPressed = UIAlertAction(title: "No", style: .default, handler: { (action) in
                })
                alertController.addAction(yesPressed)
                alertController.addAction(noPressed)
                present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Unable to place a phone call", message: "Your device could not place a phone call.", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
                })
                alertController.addAction(cancel)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
