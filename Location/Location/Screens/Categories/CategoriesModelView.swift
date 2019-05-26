//
//  CategoriesModelView.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation
import UIKit
import Moya

class CategoriesModelView: NSObject {
    
    var categoriesList:[Categories]?
    var locations = [Location]()
    
    
    override init() {
        super.init()
        
        locations.removeAll()
        DataManager().getCategories(completionHandler: { [weak self] (categories, error) in
            print(categories)
            self?.categoriesList = categories
            
            
            DataManager().getLocation(target: APIService.restaurants,completionHandler: { [weak self] (categories, error) in
                self?.locations.append(contentsOf: categories)
            })
            
            DataManager().getLocation(target: APIService.vacationSpot,completionHandler: { [weak self] (categories, error) in
                self?.locations.append(contentsOf: categories)
                
            })
        })
    }
    
}


extension CategoriesModelView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoriesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategorieCell", for: indexPath)
    
        guard let data = categoriesList?[indexPath.row] else {
            return cell
        }

        cell.textLabel?.text = data.title
        return cell

    }
    
    
}
