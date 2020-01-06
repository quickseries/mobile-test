//  ResourceDetailViewController.swift
//  QuickSeries
//
//  Created by Franck Clement on 06/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

protocol ResourceDetailViewControllerActionDelegate: class {
    func didTap(cell: TappableCell)
}

class ResourceDetailViewController: UITableViewController {
    
    private let viewModel: ResourceDetailViewModel
    weak var actionDelegate: ResourceDetailViewControllerActionDelegate?
    
    init(viewModel: ResourceDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        tableView.reloadData()
    }
    
    private func setupTableView() {
        
        tableView.register(UINib(nibName: String(describing: HeaderCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeaderCell.self))
        tableView.register(UINib(nibName: String(describing: TappableCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TappableCell.self))
        
        tableView.dataSource = self.viewModel
        tableView.delegate = self
    }
}

extension ResourceDetailViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) {
            switch cell {
            case is TappableCell:
                if let tappableCell = cell as? TappableCell {
                    actionDelegate?.didTap(cell: tappableCell)
                }
            default: break
            }
        }
    }
}
