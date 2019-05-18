//
//  ResourceListViewController.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import UIKit

protocol ResourceListView: class {
    func reloadData()
}

class ResourceListViewController: UIViewController {

    private struct Constant {
        static let title = "Resource List"
        static let cellId = "cellId"
    }
    
    @IBOutlet private weak var resourceListTableView: UITableView! {
        didSet {
            resourceListTableView.delegate = self
            resourceListTableView.dataSource = self
            resourceListTableView.estimatedRowHeight = 77
            resourceListTableView.rowHeight = UITableView.automaticDimension
            resourceListTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.cellId)
        }
    }
    
    var configurator: ResourceListConfigurator!
    var router: ResourceListRouter?
    var presenter: ResourceListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configurator.configure(controller: self)
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        navigationItem.title = Constant.title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
}

extension ResourceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.countOfResources
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter.resource(at: indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellId, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        cell.accessoryType = .disclosureIndicator
        cell.configureCell(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = presenter.resource(at: indexPath.row){
            router?.pushResourceDetailScreen(with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ResourceListViewController: ResourceListView {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.resourceListTableView.reloadData()
        }
    }
    
}
