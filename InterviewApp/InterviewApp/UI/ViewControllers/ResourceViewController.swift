//
//  ResourceViewController.swift
//  InterviewApp
//
//  Created by Georgi Popov on 2017-10-13.
//  Copyright © 2017 none. All rights reserved.
//

import UIKit

class ResourceViewController : GenericViewController {
    
    private let photoKey = "photo"
    private let titleKey = "title"
    private let descriptionKey = "description"

    private let contactInfoKey = "contactInfo"
    private let addressesKey = "addresses"
    private let bizHoursKey = "bizHours"
    private let socialMediaKey = "socialMedia"
    private let countKey = "count"
    
    var resourceMap : [String:Any] = [:]
    var resource : [String : Any] = [:]
    @IBOutlet weak var resourceTable: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func unwindToResourcesListViewController(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resourceTable.delegate = self
        self.resourceTable.dataSource = self
        self.resourceTable.tableFooterView = UIView()
        fillResourceMap()
    }
    
    func getDataWithUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func setImage(url: URL,imageView:UIImageView) {
        getDataWithUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    func fillResourceMap() {
        var count = 0
        
        if let contactInfoData = getValidData(fromResourceDict: self.resource[Constants.RESOURCE_CONTACT_INFO_KEY] as? [String: [String]]) {
            count += 1
            resourceMap[contactInfoKey] = contactInfoData
            resourceMap["\(count)"] = contactInfoKey
        }
        
        if let addresses = self.resource[Constants.RESOURCE_ADDRESSES_KEY] as? [[String:Any]], addresses.count > 0 {
            var validAddresses = false
            for address in addresses {
                if address.keys.count == 0 {
                    continue
                } else {
                    validAddresses = true
                }
            }
            if validAddresses {
                count += 1
                resourceMap[addressesKey] = addresses
                resourceMap["\(count)"] = addressesKey
            }
        }
        
        if let bizHours = self.resource[Constants.RESOURCE_HOURS_KEY] as? [String: Any] , bizHours.keys.count > 0 {
            // could add some extra checks for valid data
            count += 1
            resourceMap[bizHoursKey] = bizHours
            resourceMap["\(count)"] = bizHoursKey
        }
        
        
        if let socialMediaData = getValidData(fromResourceDict: self.resource[Constants.RESOURCE_SOCIAL_MEDIA_KEY] as? [String: [String]]) {
            count += 1
            resourceMap[socialMediaKey] = socialMediaData
            resourceMap["\(count)"] = socialMediaKey
        }
        
        resourceMap[countKey] = count
    }
    
    func getValidData(fromResourceDict:[String: [String]]?) -> [String:[String]]? {
        if let socialMedia = fromResourceDict , socialMedia.keys.count > 0 {
            var realMediaData : [String:[String]] = [:]
            for socialMediaKey in Array(socialMedia.keys) {
                var typeValidData : [String] = []
                if let valArray = socialMedia[socialMediaKey], valArray.count > 0 {
                    for val in valArray {
                        if val.characters.count > 0 {
                            typeValidData.append(val)
                        }
                    }
                }
                if typeValidData.count > 0 {
                    realMediaData[socialMediaKey] = typeValidData
                }
            }
            
            if realMediaData.keys.count > 0{
                return realMediaData
            }
        }
        return nil
    }
    
}

extension ResourceViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        var count = 1
        if let countDetails = resourceMap[countKey] as? Int {
            count += countDetails
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            var count = 1
            if resource[photoKey] != nil {
                count += 1
            }
            return count
        } else {
            let key = resourceMap["\(section)"] as! String
            if key == socialMediaKey {
                return 1
            } else if key == bizHoursKey {
                return 7
            }
            let resourceDetails = resourceMap[key]
            if let resourceDetailsArray = resourceDetails as? [ Any ]  {
                return resourceDetailsArray.count
            } else if let resourceDetailsDict = resourceDetails as? [String:Any] {
                return resourceDetailsDict.keys.count
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 54
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.width, height: 64))
        let label = UILabel(frame: CGRect(x: 16, y: (view.frame.size.height - 20)/2, width: view.frame.size.width - 16, height: 20))
        let key = resourceMap["\(section)"] as! String
        label.text = key.localized
        label.font = UIFont(name: "Helvetica", size: 15)
        view.backgroundColor = UIColor(hexString: "#F2F1F1")
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 && resource[photoKey] != nil {
                return Constants.CELL_HEIGHT_PHOTO
            } else {
                return UITableViewAutomaticDimension
            }
        } else if indexPath.section >= 1 {
            let key = resourceMap["\(indexPath.section)"] as! String
            if key == addressesKey {
                return 124
            }
            
        }
        return Constants.CELL_HEIGHT_SMALL
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 && resource[photoKey] != nil {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "photo") as? PhotoCell {
                    if let photoURLStr = resource[photoKey] as? String {
                        setImage(url: URL(string: photoURLStr)!, imageView: cell.photoView)
                    }
                    return cell
                }
            } else if let cell = tableView.dequeueReusableCell(withIdentifier: "nameDetailsCell") as? NameDetailsCell {
                if let title = resource[titleKey] as? String {
                    cell.titleLabel.text = title
                }
                if let description = resource[descriptionKey] as? String {
                    cell.descriptionTextView.text = description.htmlToString
                    cell.descriptionTextView.textContainer.lineFragmentPadding = 0
                }
                return cell
            }
        } else {
            let key = resourceMap["\(indexPath.section)"] as! String
            switch key {
            case contactInfoKey:
                if let data = resourceMap[key] as? [String:[String]] {
                    let contactKey = Array(data.keys)[indexPath.row]
                    if let valueArray = data[contactKey] {
                        if let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as? ContactCell {
                            cell.typeLabel.text = contactKey.localized
                            cell.contactLabel.text = valueArray[0]
                            let iconStr = Contact.getIconString(rawValue: contactKey)
                            cell.iconLabel.text = iconStr
                            return cell
                        }
                    }
                }
            case socialMediaKey:
                if let data = resourceMap[key] as? [String:[String]] {
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "socialMediaCell") as? SocialMediaCell {
//                        let startCenter = cell.facebookBtn.center
                        var currentBtnNum = 0
                        let mediaKeys = SocialMedia.daysArray()
                        var btn : UIButton?
                        for media in mediaKeys {
                            switch media {
                            case .facebook:
                                btn = cell.facebookBtn
                            case .twitter:
                                btn = cell.twitterBtn
                            case .youtubeChannel:
                                btn = cell.youtubeBtn
                            }
                        
                            
                            if let button = btn {
                                if let socialMedia = data[media.rawValue] {
                                    cell.urls[currentBtnNum] = socialMedia[0]
                                    button.isHidden = false
                                    button.center = CGPoint(x: button.frame.size.width * CGFloat(currentBtnNum) + 10 + button.frame.size.width/2 , y: button.center.y)
                                } else {
                                    button.isHidden = true
                                }
                            }
                            
                            currentBtnNum += 1
                        
                        }
                        cell.delegate = self
                        return cell
                    }
                    
                }
            case bizHoursKey:
                if let data = resourceMap[key] as? [String:[String:String]] {
                    let currentDay = WeekDay.daysArray()[indexPath.row]
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "bizHoursCell") as? BusinessHoursCell {
                        var from : String = ""
                        var to :String = ""
                        if let valueData = data[currentDay.rawValue] {
                            if let fromVal = valueData[Constants.RESOURCE_FROM_KEY] {
                                from = fromVal
                            }
                            if let toVal = valueData[Constants.RESOURCE_TO_KEY] {
                                to = toVal
                            }
                        }
                        if from.characters.count > 0 {
                            cell.hoursLabel.text = "\(from) - \(to)"
                        } else {
                            cell.hoursLabel.text = "Closed".localized
                        }
                        cell.dayLabel.text = currentDay.display()
                        cell.selectionStyle = UITableViewCellSelectionStyle.none
                        return cell
                    }
                    
                }
            case addressesKey:
                if let addresses = resourceMap[key] as? [[String:Any]] {
                    let address = addresses[indexPath.row]
                    if let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell") as? AddressCell {
                        cell.line1Label.text = "\(address["address1"]!)"
                        cell.line1Labe2.text = "\(address["city"]!),\(address["state"]!),\(address["zipCode"]!)"
                        cell.line1Labe3.text = "\(address["country"]!)"
                        return cell
                    }
                    
                }
            default:
                break
            }
                
            

        }
        
        ///////
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            tableView.deselectRow(at: indexPath, animated: false)
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
        let key = resourceMap["\(indexPath.section)"] as! String
        if key == addressesKey {
            if let addresses = resourceMap[key] as? [[String:Any]] {
                let address = addresses[indexPath.row]
                if let gps = address[Constants.RESOURCE_GPS_KEY] as? [String:String] {
                    let lat : Double = NSString(string: gps[Constants.RESOURCE_LAT_KEY]!).doubleValue
                    let lng : Double = NSString(string: gps[Constants.RESOURCE_LNG_KEY]!).doubleValue
                    self.openMap(lat: lat, lng: lng, placeName: address["label"]! as! String)
                } else {
                    let addressStr = "\(address["address1"]!), \(address["city"]!),\(address["zipCode"]!),\(address["country"]!)"
                    self.openAddress(forAddress: addressStr, placeName: address["label"]! as! String)
                }
            }
        } else if key == contactInfoKey {
            if let data = resourceMap[key] as? [String:[String]] {
                let contactKey = Array(data.keys)[indexPath.row]
                if let valueArray = data[contactKey] {
                    let value = valueArray[0]
                    if contactKey == Contact.phoneNumber.rawValue || contactKey == Contact.tollFree.rawValue {
                        self.call(phone:value)
                    } else if contactKey == Contact.email.rawValue {
                        self.sendEmail(to: value)
                    } else if contactKey == Contact.website.rawValue {
                        self.open(url: URL(string:value)!)
                    }
//                    if let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as? ContactCell {
//                        cell.typeLabel.text = contactKey.localized
//                        cell.contactLabel.text = valueArray[0]
//                        let iconStr = Contact.getIconString(rawValue: contactKey)
//                        cell.iconLabel.text = iconStr
//                        return cell
//                    }
                }
            }
        }
    }
}

extension ResourceViewController : SocialMediaCellDelegate {
    func didSelectMedia(with url: URL) {
        self.open(url: url)
    }
}


