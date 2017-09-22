//
//  CategoriesViewController.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var dataSource:[Category] = []
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.CellCategory)
        tableView.rowHeight = UITableViewAutomaticDimension;
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = Bundle.main.url(forResource: "categories", withExtension: "json") else {
            return
        }
        
        do {
            if let data = try? Data(contentsOf: url),
                let jsonCategory = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                for category in jsonCategory {
                    dataSource.append(Category(json: category))
                }
            }
            
        } catch {
            print("Error deserializing JSON: \(error)")
        }
        self.view.updateConstraintsIfNeeded()
        tableView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(tableView)
        self.view.backgroundColor = .white
        self.title = "Categories"
        
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellCategory, for: indexPath)
        
        let data = dataSource[indexPath.row]
        
        cell.textLabel?.text = data.title
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataSource[indexPath.row]
        
        guard let slug = data.slug else {
            return
        }
        switch(slug){
        case "restaurants":
            let rvc = RestaurantsViewController()
            rvc.title = "Restaurants"
            self.navigationController?.pushViewController(rvc, animated: true)
        case "vacation-spots":
            let vsvc = VacationSpotViewController()
            vsvc.title = "Vacation Spots"
            self.navigationController?.pushViewController(vsvc, animated: true)
        default:
            break
        }
    }
}

