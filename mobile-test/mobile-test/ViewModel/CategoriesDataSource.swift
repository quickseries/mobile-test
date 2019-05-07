//
//  CategoriesDataSource.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/25/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import Foundation
import UIKit

class CategoriesDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var categories = [Category]()
    var dataChanged: (() -> Void)?
    var selectedCategory: Category?
    var dataSelected: (() -> Void)?
    var cellId = "cellId"
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.title
        cell.detailTextLabel?.text = category.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        dataSelected?()
    }
    
    func fetchCategories(){
        let categoriesUrl = "https://raw.githubusercontent.com/alipishvaee/mobile-test/master/data/categories.json"
        ApiService().getData(url: categoriesUrl) { (response: [Category]?) in
            guard let response = response else { return }
            self.categories = response
            self.dataChanged?()
        }
    }
    
}

