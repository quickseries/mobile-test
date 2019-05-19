//
//  ResourceListViewController.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import UIKit

protocol ResourceListView: class {
    func reloadData()
    func setTitle(with type: CategoryType)
}

enum SortType {
    case aToz, zToa, none
    
    mutating func toggle()
    {
        switch self {
        case .none: self = SortType.aToz
        case .aToz: self = SortType.zToa
        case .zToa: self = SortType.aToz
        }
    }
}

class ResourceListViewController: UIViewController {
    
    private struct Constant {
        static let restaurants = "Restaurants"
        static let vacationSpots = "Vacation-Spots"
        static let cellId = "cellId"
        static let imageAtoZ = "atoz"
        static let imageZtoA = "ztoa"
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
    
    private var type: SortType = .zToa
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configurator.configure(controller: self)
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: Constant.imageAtoZ), style: .plain, target: self, action: #selector(buttonFilterTapped))
    }
    
    private func setRightBarImage() {
        switch type {
        case .aToz:
            navigationItem.rightBarButtonItem?.image = UIImage(named: Constant.imageZtoA)
        case .zToa:
            navigationItem.rightBarButtonItem?.image = UIImage(named: Constant.imageAtoZ)
        case .none: break
        }
    }
    
    @objc private func buttonFilterTapped() {
        type.toggle()
        presenter.sortList(by: type)
        setRightBarImage()
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
    
    func setTitle(with type: CategoryType) {
        switch type {
        case .restaurant: navigationItem.title = Constant.restaurants
        case .vacationSports: navigationItem.title = Constant.vacationSpots
        }
        
    }
}
