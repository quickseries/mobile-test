//
//  CategoriesDataSource.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-19.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import Foundation
import UIKit

enum Category: String {
    case restaurants = "ac5bd194-11de-48f6-94db-fd16cfccb570"
    case vacationSpots = "83a5bc0d-bae7-4b3f-b8d9-01c969785783"
    case none = ""
    
    var id: String {
        return self.rawValue
    }
}

enum CategoryField: String {
    case slug
    case title
    case description
    
    var description: String {
        return self.rawValue
    }
}

class CategoriesDataSource: NSObject, UITableViewDataSource {
    
    var categories: [Dictionary<String, AnyObject>]?
    
    override init() {
        guard let loadedJSON = JSONLoader.readJson(fromFile: .categoriesFile) else { fatalError() }
        categories = loadedJSON
        super.init()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categories = self.categories else { fatalError() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let cellCategory = categories[indexPath.row]
        cell.textLabel?.text = cellCategory[CategoryField.title.description] as? String
        return cell
     }
}


