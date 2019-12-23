//
//  ResourcesVC.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-20.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

class ResourcesVC: UITableViewController {
    
    let resourcesDataSource = ResourcesDataSource()
    var flagSortDescriptor: Bool! = true

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = resourcesDataSource
    }
    
    func loadRestaurantData() {
        
        Webservices.loadRestaurantData { (restaurant, success) in
            OperationQueue.main.addOperation {
                self.resourcesDataSource.resources = restaurant!
                self.resourcesDataSource.resources.sort { $0.title < $1.title }
                self.tableView.reloadData()
            }
        }
    }
    
    func loadVacationSpot() {
        Webservices.loadVacationSpotData { (vacationSpot, success) in
            OperationQueue.main.addOperation {
                self.resourcesDataSource.resources = vacationSpot!
                self.resourcesDataSource.resources.sort { $0.title < $1.title }
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func btnSortAction(_ sender: UIBarButtonItem) {

        if !flagSortDescriptor {
            self.resourcesDataSource.resources.sort { $0.title < $1.title
            }
        } else {
            self.resourcesDataSource.resources.sort { $0.title > $1.title
            }
        }
        flagSortDescriptor = !flagSortDescriptor
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if
            let detailVC = segue.destination as? DetailVC,
            let Cell = sender as? UITableViewCell,
            let row = tableView.indexPath(for: Cell)?.row {
                let resource = self.resourcesDataSource.resources[row]
                detailVC.title = resource.title
                detailVC.resourceDetail = resource
        }
    }
    
    //
    // MARK: - UITableViewDelegate
    //
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
