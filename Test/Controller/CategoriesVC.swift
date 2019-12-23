//
//  CategoriesVC.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

class CategoriesVC: UITableViewController {

    //
    // MARK: - Variables And Properties
    //

    let categoriesDataSource = CategoriesDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = categoriesDataSource
        Webservices.loadCategoryData { (category, success) in
            DispatchQueue.main.async {
                self.categoriesDataSource.categories = category!
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if
            let resourcesVC = segue.destination as? ResourcesVC,
            let Cell = sender as? UITableViewCell,
            let row = tableView.indexPath(for: Cell)?.row {
            if row == 0 {
                resourcesVC.title = "Restaurants"
                resourcesVC.loadRestaurantData()
            } else {
                resourcesVC.title = "Vacation Spot"
                resourcesVC.loadVacationSpot()
            }
        }
    }
    
    //
    // MARK: - UITableViewDelegate
    //

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

