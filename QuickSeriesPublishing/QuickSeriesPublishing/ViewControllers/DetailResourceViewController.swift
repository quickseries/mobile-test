//
//  DetailResourceViewController.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-22.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class DetailResourceViewController: UIViewController {
    @IBOutlet private weak var detailTableView: UITableView!
    private var resource: Resource
    private var viewModel: DetailResourceViewModel?

    public init(_ resource: Resource) {
        self.resource = resource
        super.init(nibName: String(describing: DetailResourceViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = DetailResourceViewModel(resource)
        setTitle()
        setupTableView()
    }
}

private extension DetailResourceViewController {
    func setTitle() {
        self.title = "Resource Detail"
    }
    func setupTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        let sectionHeaderNib = UINib(nibName: String(describing: DetailResoureceSectionHeaderView.self), bundle: nil)
        detailTableView.register(sectionHeaderNib, forHeaderFooterViewReuseIdentifier: String(describing: DetailResoureceSectionHeaderView.self))
        
        let detailResourceTitleNib = UINib(nibName: String(describing: DetailResourceTitleTableViewCell.self), bundle: Bundle(for: DetailResourceTitleTableViewCell.self))
        detailTableView.register(detailResourceTitleNib, forCellReuseIdentifier: String(describing: DetailResourceTitleTableViewCell.self))
        
        let detailResourceContactNib = UINib(nibName: String(describing: DetailResourceContactTableViewCell.self), bundle: Bundle(for: DetailResourceContactTableViewCell.self))
        detailTableView.register(detailResourceContactNib, forCellReuseIdentifier: String(describing: DetailResourceContactTableViewCell.self))
        
        let detailResourceAddressNib = UINib(nibName: String(describing: DetailResourceAddressTableViewCell.self), bundle: Bundle(for: DetailResourceAddressTableViewCell.self))
        detailTableView.register(detailResourceAddressNib, forCellReuseIdentifier: String(describing: DetailResourceAddressTableViewCell.self))
        
        let detailResourceSocialMediaNib = UINib(nibName: String(describing: DetailResourceSocialMediaTableViewCell.self), bundle: Bundle(for: DetailResourceSocialMediaTableViewCell.self))
        detailTableView.register(detailResourceSocialMediaNib, forCellReuseIdentifier: String(describing: DetailResourceSocialMediaTableViewCell.self))
    }
}

extension DetailResourceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // Give a height to our table view cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let viewModel = viewModel else { return 0 }

        return CGFloat(viewModel.heightForRow(indexPath.section))
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = viewModel else { return nil }

        // Dequeue with the reuse identifier
        let header = detailTableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: DetailResoureceSectionHeaderView.self)) as! DetailResoureceSectionHeaderView
        
        header.updateHeaderView(viewModel.headerSection(section))
        
        return header
    }


    // We have only one section
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        
        return viewModel.numberOfSections()
    }

    // One cell is enough
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberRowsOfSection(section)
    }

    // Cell creation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailResourceTitleTableViewCell.self), for: indexPath) as? DetailResourceTitleTableViewCell else {
                return UITableViewCell()
            }
            
            cell.updateCell(resource.description)

        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailResourceContactTableViewCell.self), for: indexPath) as? DetailResourceContactTableViewCell else {
                return UITableViewCell()
            }
            
            cell.updateCell(resource.contactInfo?.details[indexPath.item])
        }
        
        if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailResourceAddressTableViewCell.self), for: indexPath) as? DetailResourceAddressTableViewCell else {
                return UITableViewCell()
            }
            
            if let address = resource.addresses?[indexPath.item] {
                cell.updateCell(address)
            }
        }
        
        if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailResourceSocialMediaTableViewCell.self), for: indexPath) as? DetailResourceSocialMediaTableViewCell else {
                return UITableViewCell()
            }
            
            if let socialMedia = resource.socialMedia {
                cell.updateCell(socialMedia)
            }
        }
        
        return UITableViewCell()
    }

}
