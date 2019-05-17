//
//  QuickTableViewDataSource.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation
import UIKit

class QuickTableViewDataSource<Cell :UITableViewCell,model> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier :String!
    private var items :[model]!
    var configureCell :(Cell,model) -> ()
    
    init(cellIdentifier :String, items :[model], configureCell: @escaping (Cell,model) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
}
