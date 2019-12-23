//
//  CategoriesDataSource.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

class CategoriesDataSource: NSObject, UITableViewDataSource {
    
    //
    // MARK: - Variables And Properties
    //
    var categories = [Category]()
    
    //
    // MARK: - UITableViewDataSource
    //

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "CategoriesTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CategoriesTableViewCell
        
        let category = categories[indexPath.row]
        cell.titleLabel.text = category.title
        
        return cell
    }
}
