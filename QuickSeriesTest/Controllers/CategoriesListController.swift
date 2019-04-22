//
//  CategoriesListController.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-19.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import UIKit

class CategoriesListController: UITableViewController {
    let dataSource = CategoriesDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataSource
    }

    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let categoryDict = self.dataSource.categories?[indexPath.row],
            let categoryID = categoryDict["eid"] as? String,
            let category = Category(rawValue: categoryID) {
            
            performSegue(withIdentifier: "resourcesSegue", sender: category)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resourcesSegue" {
            if let senderCategory = sender as? Category,
                let destinationTVC: ResourceListController = segue.destination as? ResourceListController {
                
                destinationTVC.category = senderCategory
            }
            
        }
    }
    

}
