//
//  ResourcesViewModel.swift.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-20.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit

class ResourcesViewModel: NSObject {
    fileprivate(set) var resources: [Resource] = []
	var category: Category?
	
	public func fetch(completion: @escaping (Result<[Resource]?, APIError>) -> Void) {
		guard let category = category else { return }
		
		API.fetchResources(category: category) { result in
			
			switch result {
			case .success(let resources):
				if let resources = resources {
					self.resources = resources
				}
				break
			case .failure:
				break

			}
			completion(result)
		}
    }
}


extension ResourcesViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let resource = resources[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoriesTableViewCell.self), for: indexPath)
		cell.textLabel?.text = resource.title
		cell.detailTextLabel?.text = resource.description?.stripHTML()
		return cell
    }
}

