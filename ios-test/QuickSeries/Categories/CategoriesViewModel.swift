//  CategoriesViewModel.swift
//  QuickSeries
//
//  Created by Franck Clement on 04/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

class CategoriesViewModel: NSObject {
    
    fileprivate(set) var categories: [Category] = []
    
    private var status: NetStatus = .finished {
        didSet {
            statusDidChange?(status)
        }
    }
    
    private let service: CategoryService
    
    /// Closure-based binding from Networking state to the view
    public var statusDidChange: ((NetStatus) -> ())?
    
    init(service: CategoryService) {
        self.service = service
    }
    
    public func fetchCategories() {
        status = .loading
        self.service.fetch { result in
            switch result {
            case .success(let categories):
                self.categories = categories
                self.status = .finished
            case .failure(let error):
                self.status = .failure(error: error)
            }
        }
    }
}

extension CategoriesViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategoryCell.self)) as? CategoryCell {
            cell.configureCell(with: categories[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
}
