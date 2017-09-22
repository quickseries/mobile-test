//
//  RestaurantsViewController.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//


import UIKit

class RestaurantsViewController: UIViewController {
    
    var dataSource:[Restaurant] = []
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.CellRestaurant)
        tableView.rowHeight = UITableViewAutomaticDimension;
        return tableView
    }()
    
    var sorted:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(RestaurantsViewController.sortDataSource))
        
        guard let url = Bundle.main.url(forResource: "restaurants", withExtension: "json") else {
            return
        }
        
        do {
            if let data = try? Data(contentsOf: url),
                let jsonRestaurant = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                for restaurant in jsonRestaurant {
                    dataSource.append(Restaurant(json: restaurant))
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
        
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func sortDataSource(){
        if sorted{
            dataSource.reverse()
        } else {
            sorted = true
            dataSource.sort() { $0.title! < $1.title! }
        }
        tableView.reloadData()
    }
}

extension RestaurantsViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellRestaurant, for: indexPath)
        
        let data = dataSource[indexPath.row]
        
        cell.textLabel?.text = data.title
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = dataSource[indexPath.row]
        let rvc = ResourcesViewController()
        rvc.dataSource = data
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}


