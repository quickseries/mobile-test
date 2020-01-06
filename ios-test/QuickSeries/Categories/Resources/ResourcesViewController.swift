//  ResourcesViewController.swift
//  QuickSeries
//
//  Created by Franck Clement on 05/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

protocol ResourcesViewControllerActionDelegate: class {
    func didTap(resource: Resource)
}

class ResourcesViewController: UITableViewController {
    
    weak var actionDelegate: ResourcesViewControllerActionDelegate?
    private let viewModel: ResourcesViewModel
    
    init(viewModel: ResourcesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
        setupSortButton()
        
        self.viewModel.fetchItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView
            .indexPathsForSelectedRows?
            .forEach { self.tableView.deselectRow(at: $0, animated: true) }
    }
    
    private func setupTableView() {
        self.tableView.register(UINib(nibName: String(describing: ResourceCell.self), bundle: nil),
                                forCellReuseIdentifier: String(describing: ResourceCell.self))
        
        self.tableView.dataSource = viewModel
        self.tableView.delegate = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    
    private func setupViewModel() {
        self.viewModel.statusDidChange = { status in
            switch status {
            case .loading: break
            case .finished:
                self.viewModel.resetSort()
                self.setupSortButton()
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            case .failure(let error):
                self.handle(error: error)
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    private func setupSortButton() {
        let sortButton = UIBarButtonItem(title: "A-Z", style: .plain, target: self, action: #selector(sort(_:)))
        navigationItem.rightBarButtonItem = sortButton
    }
    
    @objc private func sort(_ sender: Any) {
        guard let sortButton = sender as? UIBarButtonItem else { return }
        sortButton.title = self.viewModel.sortItems() ? "A-Z" : "Z-A"
        self.tableView.reloadData()
    }
        
    @objc private func refresh(_ sender: Any) {
        self.viewModel.fetchItems()
    }
}


extension ResourcesViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionDelegate?.didTap(resource: viewModel.items[indexPath.item])
    }
}
