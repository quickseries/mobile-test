//
//  ResourceDetailsViewController.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import UIKit

protocol ResourceDetailsView: class {
    func reloadData()
    func setTitle(with name:String)
}

class ResourceDetailsViewController: UIViewController {
    
    private struct Constant {
        static let title = "Resource List"
        static let headerCellId = "headerCellId"
        static let photoCellId = "photoCellId"
        static let tableViewCellId = "tableViewCellId"
        static let contactInfoCellId = "contactInfoCellId"
        static let socialMediaCellId = "socialMediaCellId"
        static let bizHourCellId = "bizHourCellId"
    }
    
    @IBOutlet private weak var resourceDetailsTableView: UITableView! {
        didSet {
            congureTableView()
        }
    }
    
    var configurator: ResourceDetailsConfigurator!
    var presenter: ResourceDetailsPresenter!
    var router:ResourceDetailsRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(controller: self)
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func congureTableView() {
        resourceDetailsTableView.delegate = self
        resourceDetailsTableView.dataSource = self
        resourceDetailsTableView.estimatedRowHeight = 77
        resourceDetailsTableView.rowHeight = UITableView.automaticDimension
        resourceDetailsTableView.estimatedSectionHeaderHeight = 44
        resourceDetailsTableView.sectionHeaderHeight = UITableView.automaticDimension
        resourceDetailsTableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.headerCellId)
        resourceDetailsTableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.photoCellId)
        resourceDetailsTableView.register(UINib(nibName: "ContactInfoTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.contactInfoCellId)
        resourceDetailsTableView.register(UINib(nibName: "SocialMediaTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.socialMediaCellId)
        resourceDetailsTableView.register(UINib(nibName: "BizHourTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.bizHourCellId)
    }
    
}

extension ResourceDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let title = presenter.sectionTitle(for: section), let cell = tableView.dequeueReusableCell(withIdentifier: Constant.headerCellId) as? HeaderTableViewCell else {
            return UIView()
        }
        cell.set(title: title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter.sectionItemType(at: indexPath.section) else {
            return UITableViewCell()
        }
        //return UITableViewCell()
        return cell(for: item, indexPath: indexPath, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter.heightForRow(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func cell(for sectionItemType: SectionItemType, indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let row = indexPath.row
        switch sectionItemType {
        case .photo(let url):
            if let photoCell = tableView.dequeueReusableCell(withIdentifier: Constant.photoCellId, for: indexPath) as? PhotoTableViewCell {
                photoCell.loadImage(with: url)
                return photoCell
            }
            
        case .resourceDetail(let title, let description):
            return resourceDetailCell(title: title, description: description)
            
        case .contact(let contacts):
            if row < contacts.count, let contactInfoCell = tableView.dequeueReusableCell(withIdentifier: Constant.contactInfoCellId, for: indexPath) as? ContactInfoTableViewCell {
                contactInfoCell.configureCell(with: contacts[row])
                contactInfoCell.delegate = router as? ContactInfoTableViewCellDelegate
                return contactInfoCell
            }
            
        case .address(let addresses):
            if row < addresses.count,
                let addressCell = tableView.dequeueReusableCell(withIdentifier: Constant.contactInfoCellId, for: indexPath) as? ContactInfoTableViewCell {
                addressCell.configureCell(with: addresses[row])
                addressCell.delegate = router as? ContactInfoTableViewCellDelegate
                return addressCell
            }
            
        case .socialMedia(let medias):
            if let socialMediaCell = tableView.dequeueReusableCell(withIdentifier: Constant.socialMediaCellId, for: indexPath) as? SocialMediaTableViewCell {
                socialMediaCell.configureCell(with: medias)
                socialMediaCell.delegate = router as? ContactInfoTableViewCellDelegate
                return socialMediaCell
            }
            
        case .bizHours(let hours):
            if row < hours.count,
                let bizHourCell = tableView.dequeueReusableCell(withIdentifier: Constant.bizHourCellId, for: indexPath) as? BizHourTableViewCell {
                bizHourCell.configureCell(with: hours[row])
                return bizHourCell
            }
        }
        return UITableViewCell()
    }
    
    private func resourceDetailCell(title: String?, description: String?) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constant.tableViewCellId)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        cell.textLabel?.text = title
        cell.textLabel?.numberOfLines = 0
        
        cell.detailTextLabel?.text = description
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        cell.backgroundColor = UIColor.getHeaderViewBackgroundColor()
        return cell
    }
    
}

extension ResourceDetailsViewController: ResourceDetailsView {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.resourceDetailsTableView.reloadData()
        }
    }
    
    func setTitle(with name: String) {
        navigationItem.title = name
    }
}
