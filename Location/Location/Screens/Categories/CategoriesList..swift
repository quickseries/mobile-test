//
//  ViewController.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import UIKit
import Moya


class CategoriesList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let viewModel = CategoriesModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = viewModel
        tableView?.estimatedRowHeight = 50
        tableView?.rowHeight = UITableView.automaticDimension
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "LocationList" {
            guard let locationVC = segue.destination as? LocationList else {
                return
            }
            
            if let indexpath =  self.tableView.indexPathForSelectedRow {
                guard let category = self.viewModel.categoriesList?[indexpath.row] else {
                    return
                }
                let filteredLocations = self.viewModel.locations.filter( {$0.category_eid == category.eid} )
                locationVC.viewModel.locations = filteredLocations
            }
        }
    }
}

