//
//  ViewController.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/25/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let dataSource = CategoriesDataSource()
    lazy var categoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Categories"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        [categoriesTableView].forEach({view.addSubview($0)})
        categoriesTableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        dataSource.dataChanged = { [weak self] in
            self?.categoriesTableView.reloadData()
        }
        dataSource.fetchCategories()
        dataSource.dataSelected = { [weak self] in
            guard let category = self?.dataSource.selectedCategory else { return }
            let resourceVC = ResourceViewController()
            resourceVC.category = category
            self?.navigationController?.pushViewController(resourceVC, animated: true)
        }
        
        
        
    }
    
    
}


