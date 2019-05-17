//
//  RestaurantViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RestaurantsViewController: UIViewController {
  @IBOutlet weak var restaurantsTableView: UITableView!
  var seachBarButton: UIBarButtonItem?
  var sortBarButton: UIBarButtonItem?
  
  var isAtoZ = BehaviorRelay<Bool>(value: true)
  var viewModel: RestaurantsViewModel!
  private let disposeBag = DisposeBag()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    configureTableView()
    bindViewModel()
  }
  
  // MARK: - Functions
  private func setupUI() {
    let sortBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_sort_atoz"), style: .plain, target: self, action: #selector(handleSortUI))
    self.sortBarButton = sortBarButton
    let seachBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_search"), style: .plain, target: self, action: nil)
    self.seachBarButton = seachBarButton
    navigationItem.title = NavigationTitles.restaurants.rawValue
    navigationItem.rightBarButtonItems = [sortBarButton, seachBarButton]
  }
  private func configureTableView() {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    if #available(iOS 10.0, *) {
      restaurantsTableView.refreshControl = refreshControl
    }
    restaurantsTableView.rowHeight = 200
    let restaurantCellNib = UINib(nibName: XibNames.restaurantCell.rawValue, bundle: nil)
    restaurantsTableView.register(restaurantCellNib, forCellReuseIdentifier: CellIds.cellId.rawValue)
  }
  
  private func bindViewModel() {
    assert(viewModel != nil)
    guard let sortButton = sortBarButton else { return }
    
    isAtoZ.subscribe(onNext: { (value) in
      self.sortBarButton?.image = value ? #imageLiteral(resourceName: "ic_sort_atoz") : #imageLiteral(resourceName: "ic_sort_ztoa")
    }).disposed(by: disposeBag)
    
    let input = RestaurantsViewModel.Input(selection: restaurantsTableView.rx.itemSelected.asDriver(), sortButtonTrigger: sortButton.rx.tap.asDriver(), isAtoZ: isAtoZ)
    let output = viewModel.transform(input: input)
    
    // Bind categories to UITableView
    output.restaurants.drive(restaurantsTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: RestaurantCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
    }.disposed(by: disposeBag)
    
    output.selectedRestaurant
      .drive()
      .disposed(by: disposeBag)
  }
  @objc private func handleRefresh() {
    if #available(iOS 10.0, *) {
      restaurantsTableView.refreshControl!.endRefreshing()
    }
  }
  @objc private func handleSortUI() {
    isAtoZ.accept(!isAtoZ.value)
  }
}
