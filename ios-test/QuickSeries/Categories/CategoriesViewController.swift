//  ViewController.swift
//  QuickSeries
//
//  Created by Franck Clement on 03/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

protocol CategoriesViewControllerActionDelegate: class {
    func didTap(category: Category)
}

class CategoriesViewController: UITableViewController {
    
    weak var actionDelegate: CategoriesViewControllerActionDelegate?
    private let viewModel: CategoriesViewModel
    
    init(viewModel: CategoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("CategoriesViewController is not Storyboard or .xib based, this is OK to crash here.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
        
        self.viewModel.fetchCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView
            .indexPathsForSelectedRows?
            .forEach { self.tableView.deselectRow(at: $0, animated: true) }
    }
    
    private func setupTableView() {
        self.tableView.register(UINib(nibName: String(describing: CategoryCell.self), bundle: nil),
                                forCellReuseIdentifier: String(describing: CategoryCell.self))
        
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
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            case .failure(let error):
                self.handle(error: error)
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    @objc private func refresh(_ sender: Any) {
        self.viewModel.fetchCategories()
    }
}

extension CategoriesViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionDelegate?.didTap(category: self.viewModel.categories[indexPath.item])
    }
}

