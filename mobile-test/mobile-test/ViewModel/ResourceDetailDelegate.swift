//
//  ResourceDetailDelegate.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/26/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import Foundation
import UIKit

class ResourceDetailDelegate: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var resource: Resource?
    var dataChanged: (() -> Void)?
    var facebookSelected: (() -> Void)?
    var twitterSelected: (() -> Void)?
    var youtubeSelected: (() -> Void)?
    var callButtonSelected: (() -> Void)?
    var messageButtonSelected: (() -> Void)?
    var emailSelected: (() -> Void)?
    var websiteSelected: (() -> Void)?
    var locationSelected: (() -> Void)?
    
    var facebookUrl = ""
    var twitterUrl = ""
    var youtubeUrl = ""
    var callNo = ""
    var messageNo = ""
    var email = ""
    var website = ""
    var location: Gps?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0: return 1
        case 1: return 2
        case 2: return 5
        case 3: return resource?.addresses?.count ?? 0
        case 4: return 1
        case 5: return 1
        case 6: return 7
        default: fatalError("Not Known Section")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! DetailImageCell
                cell.detailImageView.downloadedFrom(link: resource?.photo ?? "")
                cell.separatorInset = UIEdgeInsets.init(top: 0, left: cell.bounds.size.width, bottom: 0, right: 0)
                return cell
            default:
                let cell = UITableViewCell()
                cell.textLabel?.text = "Test"
                return cell
            }
            
        case 1:
            switch indexPath.row {
            case 0 :
                let cell = UITableViewCell()
                cell.textLabel?.text = resource?.title
                cell.textLabel?.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
                return cell
            case 1:
                let cell = UITableViewCell()
                cell.textLabel?.text = resource?.description.removeHtmlTag
                cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                cell.textLabel?.numberOfLines = 0
                return cell
            default:
                let cell = UITableViewCell()
                cell.textLabel?.text = "Test"
                return cell
            }
            
        case 2:
            
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as! PhoneCell
                cell.numberText.text = resource?.contactInfo.phoneNumber[0]
                cell.phoneCaption.text = "PHONE NUMBER"
                cell.callButtonSelected = { [unowned self] in
                    guard let phoneNumber = self.resource?.contactInfo.phoneNumber[0] else { return }
                    self.callButtonSelected?()
                    self.callNo = phoneNumber
                }
                cell.messageButtonSelected = { [unowned self] in
                    guard let phoneNumber = self.resource?.contactInfo.phoneNumber[0] else { return }
                    self.messageButtonSelected?()
                    self.messageNo = phoneNumber
                }
                return cell
            case 1:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as! PhoneCell
                cell.numberText.text = resource?.contactInfo.tollFree?[0]
                cell.phoneCaption.text = "TOLL-FREE NUMBER"
                cell.callButtonSelected = { [unowned self] in
                    guard let tollFree = self.resource?.contactInfo.tollFree?[0] else { return }
                    self.callButtonSelected?()
                    self.callNo = tollFree
                }
                cell.messageButtonSelected = { [unowned self] in
                    guard let tollFree = self.resource?.contactInfo.tollFree?[0] else { return }
                    self.messageButtonSelected?()
                    self.messageNo = tollFree
                }
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as! PhoneCell
                cell.numberText.text = resource?.contactInfo.faxNumber?[0]
                cell.callButton.isHidden = true
                cell.messageButton.isHidden = true
                cell.phoneCaption.text = "FAX NUMBER"
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as! PhoneCell
                cell.callButton.setImage(#imageLiteral(resourceName: "email"), for: .normal)
                cell.messageButton.isHidden = true
                cell.phoneCaption.text = "EMAIL ADDRESS"
                cell.numberText.text = resource?.contactInfo.email?[0]
                cell.callButtonSelected = { [unowned self] in
                    guard let email = self.resource?.contactInfo.email?[0] else { return }
                    self.emailSelected?()
                    self.email = email
                }
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as! PhoneCell
                cell.callButton.setImage(#imageLiteral(resourceName: "website"), for: .normal)
                cell.messageButton.isHidden = true
                cell.callButton.isHidden = false
                cell.phoneCaption.text = "WEBSITE"
                cell.numberText.text = resource?.contactInfo.website?[0]
                cell.callButtonSelected = { [unowned self] in
                    guard let website = self.resource?.contactInfo.website?[0] else { return }
                    self.websiteSelected?()
                    self.website = website
                }
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as! PhoneCell
                cell.numberText.text = resource?.contactInfo.phoneNumber[0]
                return cell
            }
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as! AddressCell
            cell.addressText.text = resource?.addresses?[indexPath.row].address1
            cell.locationSelected = { [unowned self] in
                guard let location = self.resource?.addresses?[0].gps else { return }
                self.locationSelected?()
                self.location = location
            }
            return cell
        case 4:
            switch indexPath.row {
            case 0 :
                let cell = UITableViewCell()
                cell.textLabel?.text = resource?.description.removeHtmlTag
                cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
                cell.textLabel?.numberOfLines = 0
                return cell
            default:
                let cell = UITableViewCell()
                return cell
            }
        case 5:
            switch indexPath.row {
            case 0 :
                let cell = tableView.dequeueReusableCell(withIdentifier: "SocialMediaCell", for: indexPath) as! SocialMediaCell
                cell.facebookSelected = { [unowned self] in
                    self.facebookSelected?()
                    self.facebookUrl = self.resource?.socialMedia?.facebook[0] ?? ""
                }
                cell.twitterSelected = { [unowned self] in
                    self.twitterSelected?()
                    self.twitterUrl = self.resource?.socialMedia?.twitter[0] ?? ""
                }
                cell.youtubeSelected = { [unowned self] in
                    self.youtubeSelected?()
                    self.youtubeUrl = self.resource?.socialMedia?.youtubeChannel[0] ?? ""
                }
                return cell
            default:
                let cell = UITableViewCell()
                return cell
            }
        case 6:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "cellId")
            switch indexPath.row {
            case 0 :
                cell.textLabel?.text = "Sunday"
                cell.detailTextLabel?.text = "\(resource?.bizHours?.sunday?.from ?? "00 AM") - "+"\(resource?.bizHours?.sunday?.to.description ?? "00 PM")"
            case 1:
                cell.textLabel?.text = "Monday"
                cell.detailTextLabel?.text = "\(resource?.bizHours?.monday?.from ?? "00 AM") - "+"\(resource?.bizHours?.monday?.to.description ?? "00 PM")"
            case 2:
                cell.textLabel?.text = "Tuesday"
                cell.detailTextLabel?.text = "\(resource?.bizHours?.tuesday?.from ?? "00 AM") - "+"\(resource?.bizHours?.tuesday?.to.description ?? "00 PM")"
            case 3:
                cell.textLabel?.text = "Wednesday"
                cell.detailTextLabel?.text = "\(resource?.bizHours?.wednesday?.from ?? "00 AM") - "+"\(resource?.bizHours?.wednesday?.to.description ?? "00 PM")"
            case 4:
                cell.textLabel?.text = "Thursday"
                cell.detailTextLabel?.text = "\(resource?.bizHours?.thursday?.from ?? "00 AM") - "+"\(resource?.bizHours?.thursday?.to.description ?? "00 PM")"
            case 5:
                cell.textLabel?.text = "Friday"
                cell.detailTextLabel?.text = "\(resource?.bizHours?.friday?.from ?? "00 AM") - "+"\(resource?.bizHours?.friday?.to.description ?? "00 PM")"
            case 6:
                cell.textLabel?.text = "Saturday"
                cell.detailTextLabel?.text = "\(resource?.bizHours?.saturday?.from ?? "00 AM") - "+"\(resource?.bizHours?.saturday?.to.description ?? "00 PM")"
            default:
                cell.textLabel?.text = ""
            }
            return cell
        default:
            let cell = UITableViewCell()
            cell.textLabel?.text = "Test"
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section)
        {
        case 0: return ""
        case 1: return ""
        case 2: return "CONTACT INFORMATION"
        case 3: return "ADDRESS"
        case 4: return "NOTES"
        case 5: return "SOCIAL MEDIA"
        case 6: return "BUSINESS HOURS"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            switch indexPath.row {
            case 0: return 250
            default: return UITableView.automaticDimension
            }
        case 2:
            return 70
        case 3:
            return 70
        case 5:
            return 70
        default:
            return UITableView.automaticDimension
        }
    }
    
    
}

