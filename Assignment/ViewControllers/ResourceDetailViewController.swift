//
//  ResourceDetailViewController.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ResourceDetailViewController: UIViewController {
    var resourceDetailViewViewModel: ResourceDetailViewViewModel?
    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        listTableView.tableFooterView = UIView()
        listTableView.contentInset = UIEdgeInsets(top: -1, left: 0, bottom: 0, right: 0)
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.estimatedRowHeight = 100
        listTableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        listTableView.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "DescriptionCell")
        listTableView.register(UINib(nibName: "ContactInfoCell", bundle: nil), forCellReuseIdentifier: "ContactInfoCell")
        listTableView.register(UINib(nibName: "AddressCell", bundle: nil), forCellReuseIdentifier: "AddressCell")
        listTableView.register(UINib(nibName: "NotesCell", bundle: nil), forCellReuseIdentifier: "NotesCell")
        listTableView.register(UINib(nibName: "SocialMediaCell", bundle: nil), forCellReuseIdentifier: "SocialMediaCell")
        listTableView.register(UINib(nibName: "BusinesshoursCell", bundle: nil), forCellReuseIdentifier: "BusinesshoursCell")
    }
}

extension ResourceDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 1.0 : 32
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let resourceDetailViewViewModel = self.resourceDetailViewViewModel else {
            return ""
        }
        return resourceDetailViewViewModel.sectionHeader(forSection: section)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let resourceDetailViewViewModel = self.resourceDetailViewViewModel else {
            return 0
        }
        return resourceDetailViewViewModel.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let resourceDetailViewViewModel = self.resourceDetailViewViewModel else {
            return 0
        }
        let count = resourceDetailViewViewModel.numberOfRows(forSection: section)
        return count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let resourceDetailViewViewModel =
            self.resourceDetailViewViewModel {
            if indexPath.section == kSections.header.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
                
                if let descriptionCellViewViewModel = resourceDetailViewViewModel.descriptionCellViewViewModel{
                    cell.configure(viewModel: descriptionCellViewViewModel)
                }
                return cell
            }
            else if indexPath.section == kSections.contactInfo.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ContactInfoCell", for: indexPath) as! ContactInfoCell
                
                if let contactInfoCellViewViewModel = resourceDetailViewViewModel.contactInfoCellViewViewModel{
                    cell.configure(pContainerViewController: self, pViewModel: contactInfoCellViewViewModel, pIndex: indexPath.row)
                }
                
                return cell
            }
            else if indexPath.section == kSections.addresses.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as! AddressCell
                if let addressCellViewViewModel = resourceDetailViewViewModel.addressCellViewViewModel{
                    cell.configure(pContainerViewController: self, pViewModel: addressCellViewViewModel, pIndex: indexPath.row)
                }
                
                return cell
            }
            else if indexPath.section == kSections.notes.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NotesCell
                if let notesCellViewViewModel = resourceDetailViewViewModel.notesCellViewViewModel{
                    cell.configure(pViewModel: notesCellViewViewModel, pIndex: indexPath.row)
                    
                }
                return cell
            }
            else if indexPath.section == kSections.socailMedia.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SocialMediaCell", for: indexPath) as! SocialMediaCell
                
                if let socialMediaCellViewViewModel = resourceDetailViewViewModel.socialMediaCellViewViewModel{
                    cell.configure(pContainerViewController: self, pViewModel: socialMediaCellViewViewModel)
                    
                }
                return cell
            }
            else if indexPath.section == kSections.businessHours.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "BusinesshoursCell", for: indexPath) as! BusinesshoursCell
                
                if let businessHoursCellViewViewModel = resourceDetailViewViewModel.businessHourCellViewViewModel{
                    cell.configure(viewModel: businessHoursCellViewViewModel, pIndex: indexPath.row)
                }
                return cell
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
