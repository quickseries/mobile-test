//
//  ResourcesViewModel.swift.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-20.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

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
		guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "resourceCell"), for: indexPath) as? ResourceCell else { return UITableViewCell() }
		cell.labelTitle?.text = resource.title
		cell.labelDescription?.text = resource.description?.stripHTML()
		
		cell.resourceImageView?.af.setImage(withURL: resource.photoURL, placeholderImage: UIImage(named: "placeholder"))
		cell.resourceImageView?.contentMode = .scaleAspectFill
		cell.resourceImageView?.clipsToBounds = true;
		return cell
    }
}
