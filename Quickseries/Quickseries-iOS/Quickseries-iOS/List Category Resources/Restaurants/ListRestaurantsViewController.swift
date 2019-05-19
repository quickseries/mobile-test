//
//  ListRestaurantsViewController.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import RxSwift

final class ListRestaurantsViewController: UIViewController, ListResourcesViewController, CanSortTableView {
    
    typealias ViewModel = ListRestaurantsViewModel
    
    // MARK: Fields
    
    var viewModel = ListRestaurantsViewModel()
    let bag = DisposeBag()
    
    // MARK: Views
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        return table
    }()
    
    lazy var loadingView: LoadingView = {
        return LoadingView()
    }()
    
    lazy var errorView: ErrorView = {
        return ErrorView()
    }()
    
    lazy var sortButton: UIBarButtonItem = {
       return UIBarButtonItem(title: "Sort", style: .plain, target: nil, action: nil)
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Restaurants"
        setupBindings()
        setupViewHierarchy()
        setupConstraints()
        viewModel.requestResources()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: Actions
    
    func onResourceSelection(resource: Restaurant) {
        let destination = ResourceDetailViewController()
        destination.viewModel = ResourceDetailViewModel(resource: resource)
        navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Private Methods
    
    private func setupViewHierarchy() {
        view.addSubview(errorView)
        view.addSubview(loadingView)
        view.addSubview(tableView)
        tableView.register(ResourceTableViewCell.self, forCellReuseIdentifier: ResourceTableViewCell.identifier)
    }
    
    private func setupConstraints() {
        errorView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(self.view.safeAreaInsets)
            make.trailing.equalToSuperview().inset(self.view.safeAreaInsets)
            make.top.equalToSuperview().inset(self.view.safeAreaInsets)
            make.bottom.equalToSuperview().inset(self.view.safeAreaInsets)
        }
        loadingView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(self.view.safeAreaInsets)
            make.trailing.equalToSuperview().inset(self.view.safeAreaInsets)
            make.top.equalToSuperview().inset(self.view.safeAreaInsets)
            make.bottom.equalToSuperview().inset(self.view.safeAreaInsets)
        }
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(self.view.safeAreaInsets)
            make.trailing.equalToSuperview().inset(self.view.safeAreaInsets)
            make.top.equalToSuperview().inset(self.view.safeAreaInsets)
            make.bottom.equalToSuperview().inset(self.view.safeAreaInsets)
        }
    }
}
