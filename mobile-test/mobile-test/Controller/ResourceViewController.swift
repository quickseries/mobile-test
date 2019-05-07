//
//  ResourceViewController.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/25/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import Foundation
import UIKit

class ResourceViewController: UIViewController,UISearchResultsUpdating {
    let dataSource = ResourcesDataSource()
    var category: Category?
    var sortStatus = true
    lazy var resourceTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
        return tableView
    }()
    
    
    @objc func handleSort() {
        dataSource.sort()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        self.view.backgroundColor = .white
        title = category?.title ?? ""
        [resourceTableView].forEach({ view.addSubview($0) })
        resourceTableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        dataSource.dataChanged = { [weak self] in
            self?.resourceTableView.reloadData()
        }
        
        dataSource.dataSelected = { [weak self] in
            let detailVC = DetailViewController()
            detailVC.resource = self?.dataSource.selectedResource
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }
        
        guard let category = category else { return }
        if category.id == "59839fd7951cf747207bed3e" {
            dataSource.fetchRestaurants()
        }
        if category.id == "5983a2b7951cf747207bed41" {
            dataSource.fetchVocationSpot()
        }
        
        let sortButton = UIButton(type: .custom)
        sortButton.setImage(UIImage(named: "sort"), for: .normal)
        sortButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        sortButton.addTarget(self, action: #selector(handleSort), for: .touchUpInside)
        let sortItem = UIBarButtonItem(customView: sortButton)
        self.navigationItem.setRightBarButtonItems([sortItem], animated: true)
        
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation  = false
        search.searchBar.placeholder = "Search"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        dataSource.filterText = searchController.searchBar.text
    }
    
}

