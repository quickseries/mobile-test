//
//  DetailViewController.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/19/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit

//The third way

class DetailViewController: UIViewController {
    let headerHeight:CGFloat = 40

    private var viewModel: DetailViewModel!
    var detailModel: ListDetailModelProtocol! {
        didSet{
            self.viewModel = DetailViewModel(viewController: self)
            self.viewModel.detailObject = self.detailModel
            self.title = self.detailModel.title
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.setupTableView()
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    func setupTableView()
    {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.removeTableViewExtraEmptyCells(tableView: self.tableView)
        TitleAndDescTableViewCell.registerSelf(inTableView: self.tableView)
        ContactInformationTableViewCell.registerSelf(inTableView: tableView)
        AddressTableViewCell.registerSelf(inTableView: tableView)
        PhotoTableViewCell.registerSelf(inTableView: tableView)
        BusinessHourTableViewCell.registerSelf(inTableView: tableView)
        self.tableView.backgroundColor = .groupTableViewBackground
        
    }
}

extension DetailViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let item = self.viewModel.item(at: indexPath) {
            switch item{
                
            case .titleAndDesc(let info):
                if let cell = tableView.dequeueReusableCell(withIdentifier: TitleAndDescTableViewCell.reusableIdentifier, for: indexPath) as? TitleAndDescTableViewCell {
                    cell.info = info
                    return cell
                }
                
            case .photo(let photo):
                if let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reusableIdentifier, for: indexPath) as? PhotoTableViewCell{
                    cell.imageURL = photo.urlString
                    return cell
                }
                
            case .contactInformation(let contact):
                if let cell = tableView.dequeueReusableCell(withIdentifier: ContactInformationTableViewCell.reusableIdentifier, for: indexPath) as? ContactInformationTableViewCell {
                    cell.contactInfo = contact
                    return cell
                }
                
            case .addresses(let address):
                if let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.reusableIdentifier, for: indexPath) as? AddressTableViewCell{
                    cell.address = address.address
                    return cell
                }
                
            case .businessHours(let businessHour):
                if let cell = tableView.dequeueReusableCell(withIdentifier: BusinessHourTableViewCell.reusableIdentifier, for: indexPath) as? BusinessHourTableViewCell {
                    cell.hour = businessHour
                    return cell
                }
                
            }
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: TitleAndDescTableViewCell.reusableIdentifier, for: indexPath) as? TitleAndDescTableViewCell {
            return cell
        }
        fatalError("couldn't dequeue any cell in detail view controller")
    }
    
}

extension DetailViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: headerHeight))
        let label = UILabel(frame: CGRect(x: 8, y: 0, width: self.view.frame.width, height: headerHeight))
        label.text = self.viewModel.titleForHeader(section: section)
        headerView.addSubview(label)
        headerView.backgroundColor = .groupTableViewBackground
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
}
