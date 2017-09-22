//
//  VacationSpotViewController.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import UIKit

class VacationSpotViewController: UIViewController {
    
    var dataSource:[VacationSpot] = []
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.CellVacationSpot)
        tableView.rowHeight = UITableViewAutomaticDimension;
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = Bundle.main.url(forResource: "vacation-spot", withExtension: "json") else {
            return
        }
        
        do {
            if let data = try? Data(contentsOf: url),
                let jsonVacationSpot = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                for vacationSpot in jsonVacationSpot {
                    dataSource.append(VacationSpot(json: vacationSpot))
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
}

extension VacationSpotViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellVacationSpot, for: indexPath)
        
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
