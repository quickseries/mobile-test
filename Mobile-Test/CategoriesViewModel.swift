//
//  CategoriesViewModel.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-19.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit

class CategoriesViewModel: NSObject {
    fileprivate(set) var categories: [Category] = []

	public func fetch(completion: @escaping (Result<[Category]?, APIError>) -> Void) {
		API.fetchCategories { result in
			switch result {
			case .success(let categories):
				if let categories = categories {
					self.categories = categories
				}
			case .failure:
				break
				
			}
			completion(result)
		}
    }
}

extension CategoriesViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let category = categories[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoriesTableViewCell.self), for: indexPath)
		cell.textLabel?.text = category.title
		cell.detailTextLabel?.text = category.description
		cell.accessoryType = .disclosureIndicator
		return cell
    }
}
