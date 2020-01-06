//  ResourcesViewModel.swift
//  QuickSeries
//
//  Created by Franck Clement on 05/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

class ResourcesViewModel: NSObject {
    
    fileprivate(set) var items: [Resource] = []
    
    private var status: NetStatus = .finished {
        didSet {
            statusDidChange?(status)
        }
    }
    
    private var ascending: Bool = true
    private let service: ResourceService
    
    /// Closure-based binding from Networking state to the view
    public var statusDidChange: ((NetStatus) -> ())?
    
    init(service: ResourceService) {
        self.service = service
    }

    public func fetchItems() {
        status = .loading
        self.service.fetch { result in
            switch result {
            case .success(let items):
                self.items = items
                self.status = .finished
            case .failure(let error):
                self.status = .failure(error: error)
            }
        }
    }
    
    /// Sort the stored items, according to the current sorting order
    /// if sorted ascending, a call to this method will sort them descending
    /// and vice versa.
    /// - returns: The current order as a boolean value true -> ascending, false -> descending
    @discardableResult
    public func sortItems() -> Bool {
        self.ascending.toggle()
        self.ascending ? items.sort() : items.reverse()
        return ascending
    }
    
    /// Reset the sort order to ascending
    public func resetSort() {
        self.ascending = true
        items.sort()
    }
}

extension ResourcesViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ResourceCell.self), for: indexPath) as? ResourceCell {
            cell.configureCell(with: self.items[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
}

