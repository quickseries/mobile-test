//
//  CategoriesViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesViewController: UIViewController {
  @IBOutlet weak var categoriesTableView: UITableView!
  
  var viewModel: CategoriesViewModel!
  private let disposeBag = DisposeBag()
  
  init() {
    super.init(nibName: XibNames.categories.rawValue, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    configureTableView()
    bindViewModel()
  }
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    view.layoutIfNeeded()
  }
  // MARK: - Functions
  private func setupUI() {
    navigationItem.title = NavigationTitles.categories.rawValue
  }
  private func configureTableView() {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    if #available(iOS 10.0, *) {
      categoriesTableView.refreshControl = refreshControl
    }
    categoriesTableView.rowHeight = 120
    let categoryCellNib = UINib(nibName: XibNames.categoryCell.rawValue, bundle: nil)
    categoriesTableView.register(categoryCellNib, forCellReuseIdentifier: CellIds.cellId.rawValue)
  }
  
  private func bindViewModel() {
    assert(viewModel != nil)
    let input = CategoriesViewModel.Input(selection: categoriesTableView.rx.itemSelected.asDriver())
    let output = viewModel.transform(input: input)
    
    // Bind categories to UITableView
    output.categories.drive(categoriesTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: CategoryCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
    }.disposed(by: disposeBag)
    
    output.selectedCategory
      .drive()
      .disposed(by: disposeBag)
  }
  @objc private func handleRefresh() {
    if #available(iOS 10.0, *) {
      categoriesTableView.refreshControl!.endRefreshing()
    }
  }
}
