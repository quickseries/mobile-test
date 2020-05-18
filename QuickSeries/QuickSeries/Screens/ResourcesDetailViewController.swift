//
//  ResourcesDetailViewController.swift
//  QuickSeries
//
//  Created by Parth Patel on 15/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

enum TableSections: Int {
    case ContactInfo = 0, Address, SocialMedia, BizHours
}

class ResourcesDetailViewController: UIViewController, ResourceTableViewCellProtocol {
    
    var resource : Resources!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var addressDetails = [Addresses]()
    var contactDetails = [(String, String)]()
    var socialDetails = [(String, String)]()
    var hoursDetails = [(String, WorkingTime?)]()
    
    lazy var sectionTitles: [String] = {
        return ["Contact Information", "Address", "Social", "Business Hours"]
    }()
    
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
        sortData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateData()
    }
    
    // MARK: - Handle UI 
    func configureUIElements() {
        self.tableView.tableHeaderView = HeaderVC(resource: resource).view
    }
    
    
    // MARK: - Handle Data
    
    func sortData() {
        if let address = resource.addresses, address.filter ({ $0.address != nil}).count > 0 {
            addressDetails = address
        } else {
            addressDetails = []
        }
        
        if let contact = resource.contactInfo {
            contactDetails = getArray(mirror: Mirror(reflecting: ContactDetails(info: contact)))
        } else {
            contactDetails = []
        }
        
        if let social = resource.socialMedia {
            socialDetails = getArray(mirror: Mirror(reflecting: SocialMediaDetails(info: social)))
        } else {
            socialDetails = []
        }
        
        let mirror = Mirror(reflecting: resource.bizHours ?? BizHours())
        hoursDetails = mirror.children.map({ ($0.label!, $0.value as? WorkingTime) })
        
    }
    
    func updateData() {
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
    func getArray(mirror: Mirror) -> [(String, String)] {
        var contactObject = [(String, String)]()
        for child in mirror.children {
            if ((child.value as! (String, String?)).1 != nil && (child.value as! (String, String?)).1 != "") {
                contactObject.append(((child.value as! (String, String)).0, (child.value as! (String, String)).1))
            }
        }
        return contactObject
    }
    
    
    // MARK: - Handle Button Clicks
    
    func buttonClicked(_ sender: ResourceTableViewCell, button: UIButton) {
        guard let tappedIndexPath = tableView.indexPath(for: sender) else {
            return
        }
        
        switch TableSections(rawValue: tappedIndexPath.section) {
        case .ContactInfo:
            switch ButtonType(rawValue: button.tag) {
            case .Call:                
                callInterface(number: contactDetails[tappedIndexPath.row].1)
            case .Message:
                displayMessageInterface(number: contactDetails[tappedIndexPath.row].1)
            case .Email:
                sendEmail(email: contactDetails[tappedIndexPath.row].1)
            case .Website:
                presentSafariVC(with: URL(string: contactDetails[tappedIndexPath.row].1)!)
            default:
                print("ContactInfo Default in buttonClick")
            }
        case .Address:
            guard let lat = addressDetails[tappedIndexPath.row].gps?.latitude, let long = addressDetails[tappedIndexPath.row].gps?.longitude  else {
                presentAlertOnMainThread(title: "Alert", message: "Location coordinates are not available", buttonTitle: "OK")
                return
            }
            openAppleMap(latValue: lat, longValue: long)
        default:
            print("Default in buttonClick")
        }
        
    }    
}

extension ResourcesDetailViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSections.BizHours.rawValue + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableSections(rawValue: section) {
        case .ContactInfo:
            return contactDetails.count
        case .Address:
            return addressDetails.count
        case .SocialMedia:
            return socialDetails.isEmpty ? 0 : 1
        case .BizHours:
            return hoursDetails.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let defaultHeight = CGFloat(50)
        
        switch TableSections(rawValue: section) {
        case .ContactInfo:
            return contactDetails.isEmpty ? 0 : defaultHeight
        case .Address:
            return addressDetails.isEmpty ? 0 : defaultHeight
        case .SocialMedia:
            return socialDetails.isEmpty ? 0 : defaultHeight
        case .BizHours:
            return hoursDetails.isEmpty ? 0 : defaultHeight
        default:
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UINib(nibName: String(describing: ResourceHeaderView.self), bundle: nil).instantiate(withOwner: nil, options: nil).first as? ResourceHeaderView
        view?.sectionTitle = sectionTitles[section].uppercased()
        
        switch TableSections(rawValue: section) {
        case .ContactInfo:
            return contactDetails.isEmpty ? nil : view
        case .Address:
            return addressDetails.isEmpty ? nil : view
        case .SocialMedia:
            return socialDetails.isEmpty ? nil : view
        case .BizHours:
            return hoursDetails.isEmpty ? nil : view
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ResourceTableViewCell.self), for: indexPath) as! ResourceTableViewCell
        
        switch TableSections(rawValue: indexPath.section) {
        case .ContactInfo:
            cell.delegateButtonClick = self
            cell.configureCellWith(contactDetails[indexPath.row].1, text: contactDetails[indexPath.row].0)
        case .Address:
            cell.delegateButtonClick = self
            cell.configureAddress(address: (addressDetails[indexPath.row]))
        case .SocialMedia:
            let socialCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SocialTableViewCell.self), for: indexPath) as! SocialTableViewCell
            socialCell.cellDelegate = self
            socialCell.updateDataSource(data: socialDetails)
            return socialCell
        case .BizHours:
            let hourCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HoursTableViewCell.self), for: indexPath) as! HoursTableViewCell
            hourCell.configureCellWith(hoursDetails[indexPath.row].0, time: hoursDetails[indexPath.row].1)
            return hourCell
        default:
            cell.configureCellWith("", text: "")
        }
        return cell
    }
    
    
}

class ResourceHeaderView: UIView {
    @IBOutlet private weak var label: UILabel!
    
    var sectionTitle: String? {
        didSet { label.text = sectionTitle }
    }
}
extension ResourcesDetailViewController: CollectionViewCellDelegate {
    func collectionView(cell: SocialCollectionViewCell?, index: Int, didTappedInTableViewCell: SocialTableViewCell, socialURL: String) {
        guard let url = URL(string: socialURL)  else {
            return
        }
        presentSafariVC(with: url)
    }
}
