//
//  LocationsTableViewController.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-15.
//  Copyright © 2020 Israel Romero. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    var locations: [Location]?
    private var isSorted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let sortButton = UIBarButtonItem(image: UIImage(named: "SortAtoZ"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(doSort(_:)))
        
        self.navigationItem.rightBarButtonItem = sortButton
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "locationCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locations?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)

        // Configure the cell...
        
        if let location = locations?[indexPath.row] {
            cell.textLabel?.text = location.title
            cell.accessoryType = .disclosureIndicator
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let location = locations?[indexPath.row] else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "locationDetailsViewController") as! LocationDetailsViewController
        vc.location = location
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func doSort(_ sender: UIBarButtonItem) {
        guard let locations = locations else { return }
        
        if !isSorted {
            self.locations = locations.sorted(by: { $0.title < $1.title })
            isSorted = true
            
            let sortButton = UIBarButtonItem(image: UIImage(named: "SortZtoA"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(doSort(_:)))
                   
            self.navigationItem.rightBarButtonItem = sortButton
        } else {
            self.locations = locations.sorted(by: { $0.title > $1.title })
            isSorted = false
            
            let sortButton = UIBarButtonItem(image: UIImage(named: "SortAtoZ"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(doSort(_:)))
                   
            self.navigationItem.rightBarButtonItem = sortButton
        }
        
        tableView.reloadData()
    }
}
