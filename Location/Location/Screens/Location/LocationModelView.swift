//
//  LocationModelView.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation
import UIKit

protocol LocationProtocal {
    func sortList()
}

class LocationModelView: NSObject {
    var locations: [Location]?
    var isChecked = true

    
    override init() {
        super.init()
    }
    
    
}

extension LocationModelView : LocationProtocal {
    
    func sortList() {
        isChecked = !isChecked
        if isChecked {
            locations?.sort(by: {$1.title! < $0.title!})
            
        } else {
            locations?.sort(by: {$1.title! > $0.title!})
        }
    }
}


extension LocationModelView : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        
        guard let data = locations?[indexPath.row] else {
            return cell
        }
        
        cell.textLabel?.text = data.title
        return cell

    }
    
}
