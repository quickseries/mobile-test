//
//  ResourcesListController.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
import UIKit

protocol ResourcesListControllerProtocol: BaseViewControllerProtocol {
    var presenter: ResourcesListPresenterProtocol? { get set }
    
    func show(rows: [ResourceForUI])
}

class ResourcesListController: BaseViewController {
    var presenter: ResourcesListPresenterProtocol?
    
    @IBOutlet private weak var tableView: UITableView!
    private var rows: [ResourceForUI] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        presenter?.onViewDidLoad()
    }
}

private extension ResourcesListController {
    // MARK: - Preparations
    func prepareTableView() {
        tableView.register(cells: [ResourcesListCell.self])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

extension ResourcesListController: ResourcesListControllerProtocol {
    func show(rows: [ResourceForUI]) {
        self.rows = rows
        tableView.reloadData()
    }
}

extension ResourcesListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(cellClass: ResourcesListCell.self)
        
        cell.configure(with: model)
        
        return cell
    }
}

extension ResourcesListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = rows[indexPath.row]
        presenter?.onSelectResource(with: model.id)
    }
}
