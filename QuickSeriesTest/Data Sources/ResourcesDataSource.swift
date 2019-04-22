//
//  ResourcesDataSource.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-19.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import Foundation
import UIKit

enum ResourceField: String {
    case slug
    case title
    case description
    case photo
    case addresses
    
    var description: String {
        return self.rawValue
    }
}

class ResourcesDataSource: NSObject, UITableViewDataSource {
    
    var resources: [Dictionary<String, AnyObject>]?
    
    init(withCategory category: Category) {
        super.init()
        switch category {
        case .restaurants:
            configureDataSource(fromFile: .restaurantsFile)
        case .vacationSpots:
            configureDataSource(fromFile: .vacationSpotFile)
        default:
            break
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resources = self.resources else { fatalError() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceCell", for: indexPath)
        let resource = resources[indexPath.row]
        cell.textLabel?.text = resource[ResourceField.title.description] as? String
        return cell
    }
    
    //MARK: - Helper Methods
    
    func configureDataSource(fromFile dataFile: DataFile) {
        guard let loadedJSON = JSONLoader.readJson(fromFile: dataFile) else { fatalError() }
        self.resources = loadedJSON
    }
}


