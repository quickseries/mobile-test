//
//  DetailDataSource.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-21.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

class DetailDataSource: NSObject, UITableViewDataSource {
    
    //
    // MARK: - Variables And Properties
    //
    var resourceDetail: Resource!
    var sectionTitle: [String]!
    var contactDetail = [[String: String]]()
    
    //
    // MARK: - UITableViewDataSource
    //
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if contactDetail.count > 0 && sectionTitle[section] == DetailPageType.contactInfo.rawValue {
            return contactDetail.count
        }
        else if resourceDetail.locations != nil && sectionTitle[section] == DetailPageType.address.rawValue {
            return resourceDetail.locations?.count ?? 0
        }
        else if resourceDetail.socialMedia != nil && sectionTitle[section] == DetailPageType.socialMedia.rawValue || sectionTitle[section] == "" {
            return 1
        }
        else if resourceDetail.businessHours != nil && sectionTitle[section] == DetailPageType.businessHours.rawValue  {
            return resourceDetail.businessHours?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if contactDetail.count > 0 && sectionTitle[indexPath.section] == DetailPageType.contactInfo.rawValue {
            let identifier = "PhoneNumberTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! PhoneNumberTableViewCell

            let contact = contactDetail[indexPath.row]
            cell.phoneLabel.text = contact.keys.first
            cell.numberLabel.text = contact.values.first
            
            if contact.keys.first == Contact.phoneNumber.rawValue || contact.keys.first == Contact.tollFreeNumber.rawValue {
                cell.numberButton.setImage(UIImage(named: "call"), for: .normal)
            }
            if contact.keys.first == Contact.website.rawValue {
                cell.numberButton.setImage(UIImage(named: "website"), for: .normal)
            }
            if contact.keys.first == Contact.email.rawValue {
                cell.numberButton.setImage(UIImage(named: "email"), for: .normal)
            }

            return cell
        }
        else if resourceDetail.locations != nil && sectionTitle[indexPath.section] == DetailPageType.address.rawValue {
            let identifier = "AddressTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! AddressTableViewCell
            
            if let address = resourceDetail.locations?[indexPath.row] {
                cell.addressLabel.text = self.formattedString(address)
            }
            return cell
        }
        else if resourceDetail.socialMedia != nil && sectionTitle[indexPath.section] == DetailPageType.socialMedia.rawValue {
           let identifier = "SocialMediaTableViewCell"
           let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! SocialMediaTableViewCell
            
           return cell
        }
        else if resourceDetail.businessHours != nil && sectionTitle[indexPath.section] == DetailPageType.businessHours.rawValue {
            let identifier = "BusinessHoursTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! BusinessHoursTableViewCell

            let dayOfTheWeekKey = Array(resourceDetail.businessHours!.keys)
            cell.dayOfTheWeekLabel?.text = dayOfTheWeekKey[indexPath.row].capitalizingFirstLetter()
            let openHours = Array(resourceDetail.businessHours!.values)
            cell.hoursLabel.text = openHours[indexPath.row]["from"]! + " - " + openHours[indexPath.row]["to"]!
            
            return cell
        }
         else {
             let identifier = "DetailTableViewCell"
             let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! DetailTableViewCell
         
             cell.imgView?.image = nil
             downloadImage(resourceDetail.photo) { (data) in
                 DispatchQueue.main.async() {
                    cell.imgView?.image = UIImage(data: data)
                 }
            }
            return cell
         }
    }
}

extension DetailDataSource {
    
    func formattedString(_ address: Addresses) -> String {
        var addressString = address.address ?? ""
        addressString += "\r\n"
        addressString += address.city ?? ""
        addressString += " "
        addressString += address.state ?? ""
        addressString += " "
        addressString += address.country ?? ""
        addressString += "\r\n"
        addressString += address.zipCode ?? ""
        
        return addressString
    }
    
    func downloadImage(_ url : String, completionHandler: @escaping (Data) -> Void) {
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            completionHandler(data)
        }
        task.resume()
    }
}
