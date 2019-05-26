//
//  LocationList.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import UIKit

class LocationList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = LocationModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = viewModel
        tableView?.estimatedRowHeight = 50
        tableView?.rowHeight = UITableView.automaticDimension
        
    }
    
    @IBAction func sortButtonAction(_ sender: Any) {
        viewModel.sortList()
        self.tableView.reloadData()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "LocationDetails" {
            
            guard let detail = segue.destination as? LocationDetails else {
                return
            }
            
            if let indexpath =  self.tableView.indexPathForSelectedRow {
                detail.locations = viewModel.locations?[indexpath.row]
            }
            
        }
    }
    
    
}
