//
//  CategoryListViewController.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import UIKit

/**
 This protocol used for by Presenter to communicate with ViewController
 */
protocol CategoryListView: class {
    func reloadData()
}

/**
 Note:- this Controller uses a MVP-Clean Architectural Pattern
 This shows List of Category receieved from Backend
 */
class CategoryListViewController: UIViewController {
    
    struct Constant {
        static let title = "Category List"
        static let cellId = "cellId"
    }
    
    @IBOutlet private weak var categoryListTabbleView: UITableView! {
        didSet {
            categoryListTabbleView.delegate = self
            categoryListTabbleView.dataSource = self
            categoryListTabbleView.estimatedRowHeight = 77
            categoryListTabbleView.rowHeight = UITableView.automaticDimension
            categoryListTabbleView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: Constant.cellId)
        }
    }
    
    let configurator = CategoryListConfigurator()
    var router: CategoryListRouter?
    var presenter: CategoryListPresenter!
    
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

extension CategoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.countOfCategories ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter.category(at: indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellId, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        cell.accessoryType = .disclosureIndicator
        cell.configureCell(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = presenter.category(at: indexPath.row) {
            router?.pushResourceListScreen(with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CategoryListViewController: CategoryListView {
    
    func reloadData() {
        self.categoryListTabbleView.reloadData()
    }
}
