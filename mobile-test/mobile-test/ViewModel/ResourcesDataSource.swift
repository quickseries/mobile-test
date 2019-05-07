//
//  ResourcesDataSource.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/25/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import Foundation
import UIKit

class ResourcesDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
    
    var resources = [Resource]()
    var dataChanged: (() -> Void)?
    var selectedResource: Resource?
    var dataSelected: (() -> Void)?
    var filteredResource = [Resource]()
    var sortAscending = true
    
    var filterText: String? {
        didSet {
            filteredResource = resources.matching(filterText)
            self.dataChanged?()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredResource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let resource = filteredResource[indexPath.row]
        cell.textLabel?.text = resource.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedResource = filteredResource[indexPath.row]
        dataSelected?()
    }
    
    func sort() {
        filteredResource = filteredResource.sorted(by: sortAscending ? { $0.title > $1.title } : { $0.title < $1.title } )
        sortAscending.toggle()
        dataChanged?()
    }
    
    func fetchRestaurants(){
        let restaurantsUrl = "https://raw.githubusercontent.com/alipishvaee/mobile-test/master/data/restaurants.json"
        ApiService().getData(url: restaurantsUrl) { (response: [Resource]?) in
            guard let response = response else { return }
            self.resources = response
            self.filteredResource = response
            self.dataChanged?()
        }
    }
    
    func fetchVocationSpot(){
        let restaurantsUrl = "https://raw.githubusercontent.com/quickseries/mobile-test/master/data/vacation-spot.json"
        ApiService().getData(url: restaurantsUrl) { (response: [Resource]?) in
            guard let response = response else { return }
            self.resources = response
            self.filteredResource = response
            self.dataChanged?()
        }
    }
    
    
}

