//
//  ResourceListController.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-20.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import UIKit

class ResourceListController: UITableViewController {
    var category: Category = .none
    lazy var dataSource = ResourcesDataSource(withCategory: self.category)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataSource
    }
    
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let resource = self.dataSource.resources?[indexPath.row] {
            performSegue(withIdentifier: "resourceDetailSegue", sender: resource)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "resourceDetailSegue" {
            if let senderResource = sender as? [String: AnyObject],
                let destinationTVC: ResourceDetailController = segue.destination as? ResourceDetailController {
                
               destinationTVC.resource = senderResource
            }
        }
    }
}
