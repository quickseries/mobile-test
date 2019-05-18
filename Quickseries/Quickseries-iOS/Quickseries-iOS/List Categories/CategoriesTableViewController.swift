//
//  CategoriesTableViewController.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class CategoriesTableViewController: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorViewLabel: UILabel!
    
    //MARK: Private Properties
    
    private let viewModel = ListCategoriesViewModel()
    private let bag = DisposeBag()
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        bindTableViewData()
        bindTableViewSelection()
        subscribeToModelSelection()
        subscribeToViewModelState()
        viewModel.requestCategories()
    }
    
    //MARK: Subscription and Bindings Methods
    
    private func bindTableViewData() {
        viewModel.categories
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: CategoryTableViewCell.identifier, cellType: CategoryTableViewCell.self)) { (index, model, cell) in
                cell.viewModel = model
            }
            .disposed(by: bag)
    }
    
    private func bindTableViewSelection() {
        tableView.rx.modelSelected(CategoryCellViewModel.self)
            .subscribe(onNext: viewModel.onCategorySelected(category:))
            .disposed(by: bag)
    }
    
    private func subscribeToModelSelection() {
        viewModel.selectedCategory.subscribe(onNext: { [unowned self] categoryType in
            if let selected = self.tableView.indexPathForSelectedRow {
                self.tableView.deselectRow(at: selected, animated: true)
            }
            // TODO: Next view
        }).disposed(by: bag)
    }
    
    private func subscribeToViewModelState() {
        viewModel.state.subscribe(onNext: { state in
            UIView.animate(withDuration: 0.5, animations: {
                switch state {
                case .loading:
                    self.showLoadingView()
                    self.hideErrorView()
                    self.hideTableView()
                case .error(let message):
                    self.hideLoadingView()
                    self.showErrorView(message: message)
                    self.hideTableView()
                case .displayingData:
                    self.hideLoadingView()
                    self.hideErrorView()
                    self.showTableView()
                }
            })
        }).disposed(by: bag)
    }
    
    //MARK: View Manipulation
    
    private func showLoadingView() {
        loadingView.isHidden = false
    }
    
    private func hideLoadingView() {
        loadingView.isHidden = true
    }
    
    private func showErrorView(message: String) {
        errorView.isHidden = false
        errorViewLabel.text = message
    }
    
    private func hideErrorView() {
        errorView.isHidden = true
        errorViewLabel.text = nil
    }
    
    private func showTableView() {
        tableView.isHidden = false
    }
    
    private func hideTableView() {
        tableView.isHidden = true
    }
}
