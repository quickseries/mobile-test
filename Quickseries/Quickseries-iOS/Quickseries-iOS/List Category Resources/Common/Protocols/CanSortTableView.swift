//
//  CanSortTableView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa

protocol CanSortTableView {
 
    var sortButton: UIBarButtonItem { get }
}

extension CanSortTableView where Self : ListResourcesViewController, Self.ViewModel : CanSortResources {
    
    func setupSortButton() {
        sortButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                self?.viewModel.onSortClicked()
            })
            .disposed(by: bag)
        navigationItem.rightBarButtonItem = sortButton
    }
}
