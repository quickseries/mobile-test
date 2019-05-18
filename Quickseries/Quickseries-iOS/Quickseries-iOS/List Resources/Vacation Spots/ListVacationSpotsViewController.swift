//
//  ListVacationSpotsViewController.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import RxSwift

class ListVacationSpotsViewController: UIViewController, ListResourcesViewController  {
    
    typealias ViewModel = ListVacationSpotsViewModel
    
    // MARK: Fields
    
    let viewModel = ListVacationSpotsViewModel()
    let bag = DisposeBag()
    
    // MARK: Views
    
    lazy var tableView: UITableView = {
        return UITableView()
    }()
    
    lazy var loadingview: LoadingView = {
        return LoadingView()
    }()
    
    lazy var errorView: ErrorView = {
        return ErrorView()
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: Actions
    
    func onResourceSelection(resource: ResourceCellViewModel) {
        //TODO: Implement
    }
    
    // MARK: Private Methods
    
    private func setupConstraints() {
        //TODO: Implement
    }
}
