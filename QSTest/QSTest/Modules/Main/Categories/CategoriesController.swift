//
//  CategoriesController.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import UIKit

protocol CategoriesControllerProtocol: BaseViewControllerProtocol {
    var presenter: CategoriesPresenterProtocol? { get set }
    
    func show(rows: [CategoryForUI])
}

class CategoriesController: BaseViewController {
    var presenter: CategoriesPresenterProtocol?
    
    @IBOutlet private weak var tableView: UITableView!
    private var rows: [CategoryForUI] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        presenter?.onViewDidLoad()
    }
}

private extension CategoriesController {
    // MARK: - Preparations
    func prepareTableView() {
        tableView.register(cells: [CategoryCell.self])
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CategoriesController: CategoriesControllerProtocol {
    func show(rows: [CategoryForUI]) {
        self.rows = rows
        tableView.reloadData()
    }
}

extension CategoriesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(cellClass: CategoryCell.self)
        
        cell.configure(with: model)
        
        return cell
    }
}


extension CategoriesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = rows[indexPath.row]
        presenter?.onSelectCategory(categoryId: model.id)
    }
}
