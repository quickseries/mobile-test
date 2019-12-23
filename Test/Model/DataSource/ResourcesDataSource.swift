//
//  ResourcesDataSource.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-20.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

class ResourcesDataSource: NSObject, UITableViewDataSource {
    
    //
    // MARK: - Variables And Properties
    //
    var resources = [Resource]()
    
    //
    // MARK: - UITableViewDataSource
    //
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "ResourcesTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ResourcesTableViewCell
        
        let resource = resources[indexPath.row]
        cell.titleLabel.text = resource.title
        
        return cell
    }
}
