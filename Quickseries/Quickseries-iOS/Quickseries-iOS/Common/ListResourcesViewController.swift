//
//  ListResourcesViewController.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import RxSwift

protocol ListResourcesViewController: UIViewController {
    
    associatedtype ViewModel : ListResourcesViewModel
    
    var viewModel: ViewModel { get }
    var bag: DisposeBag { get }
    
    var tableView: UITableView { get }
    var loadingview: LoadingView { get }
    var errorView: ErrorView { get }
    
    func onResourceSelection(resource: ViewModel.EntityViewModel)
}

extension ListResourcesViewController {
    
    func setupBindings() {
        bindTableViewData()
        bindTableViewSelection()
        subscribeToModelSelection()
    }
    
   private func bindTableViewData() {
        viewModel.resources
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: ResourceTableViewCell.identifier, cellType: ResourceTableViewCell.self)) { (index, model, cell) in
               
            }
            .disposed(by: bag)
    }
    
   private func bindTableViewSelection() {
        tableView.rx.modelSelected(Self.ViewModel.EntityViewModel.self)
            .subscribe(onNext: viewModel.onResourceSelected(resource:))
            .disposed(by: bag)
    }
    
    private func subscribeToModelSelection() {
        viewModel.selectedResource
            .flatMap({ model -> Observable<Self.ViewModel.EntityViewModel> in
                if let model = model {
                    return Observable.just(model)
                } else {
                    return Observable.empty()
                }
            })
            .subscribe(onNext: { [weak self] resource in
                if let selected = self?.tableView.indexPathForSelectedRow {
                    self?.tableView.deselectRow(at: selected, animated: true)
                }
                self?.onResourceSelection(resource: resource)
            }).disposed(by: bag)
    }
    
    private func subscribeToViewModelState() {
        viewModel.state.subscribe(onNext: { [weak self] state in
            UIView.animate(withDuration: 0.5, animations: {
                switch state {
                case .loading:
                    self?.loadingview.isHidden = false
                    self?.errorView.isHidden = true
                    self?.tableView.isHidden = true
                case .error(let message):
                    self?.loadingview.isHidden = true
                    self?.errorView.isHidden = false
                    self?.errorView.messageLabel.text = message
                    self?.tableView.isHidden = true
                case .displayingData:
                    self?.loadingview.isHidden = true
                    self?.errorView.isHidden = true
                    self?.tableView.isHidden = false
                }
            })
        }).disposed(by: bag)
    }
}
