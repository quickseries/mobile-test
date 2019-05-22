//
//  RessourcesViewController.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-19.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit

class RessourcesViewController: UIViewController, StoryboardBased {
    
    static var storyboardName: String = "Categories"
    
    @IBOutlet private weak var ressourcesTableView: UITableView!
    
    private var viewModel: RessourcesViewModel!
    
    static func instantiate(viewModel: RessourcesViewModel) -> RessourcesViewController {
        let ressourcesVC = RessourcesViewController.instantiate()
        viewModel.bind(outputs: ressourcesVC)
        ressourcesVC.viewModel = viewModel
        return ressourcesVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ressourcesTableView.register(cellType: CategoryTableViewCell.self)
        self.ressourcesTableView.delegate = self
        self.ressourcesTableView.dataSource = self.viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.inputs.viewWillAppear()
    }
}

// MARK: - CategoriesViewModelOutputs
extension RessourcesViewController: RessourcesViewModelOutputs {
    func reloadData() {
        self.ressourcesTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension RessourcesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.viewModel.inputs.didSelectRow(row: indexPath.row)
    }
}
