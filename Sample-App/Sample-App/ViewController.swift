//
//  ViewController.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-15.
//  Copyright © 2020 Israel Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var data: [Category]?
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    
    private func loadData() {
        DataSourceAPI.default.fetchCategories { (result) in
            switch result {
            case .success(let categories):
                self.data = categories
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Categories"
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "categoryCell")
        
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(tableView)
        
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        if let category = data?[indexPath.row] {
            cell.textLabel?.text = category.title
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let category = data?[indexPath.row] else { return }
        
        if category.slug == "restaurants" {
            DataSourceAPI.default.fetchRestaurants { (result) in
                switch result {
                case .success(let locations):
                    DispatchQueue.main.async {
                        let vc = LocationsTableViewController()
                        vc.title = category.title
                        vc.locations = locations
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        if category.slug == "vacation-spots" {
            DataSourceAPI.default.fetchVacationSpots { (result) in
                switch result {
                case .success(let locations):
                    DispatchQueue.main.async {
                        let vc = LocationsTableViewController()
                        vc.title = category.title
                        vc.locations = locations
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

