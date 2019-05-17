//
//  VacationSpotsViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class VacationSpotsViewController: UIViewController {
  @IBOutlet weak var vacationSpotsTableView: UITableView!

  var viewModel: VacationSpotsViewModel!
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
    navigationItem.title = NavigationTitles.vacationSpots.rawValue
  }
  private func configureTableView() {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    if #available(iOS 10.0, *) {
      vacationSpotsTableView.refreshControl = refreshControl
    }
    vacationSpotsTableView.rowHeight = 200
    let vacationSpotCellNib = UINib(nibName: XibNames.vacationSpotCell.rawValue, bundle: nil)
    vacationSpotsTableView.register(vacationSpotCellNib, forCellReuseIdentifier: CellIds.cellId.rawValue)
  }
  
  private func bindViewModel() {
    assert(viewModel != nil)
    let input = VacationSpotsViewModel.Input(selection: vacationSpotsTableView.rx.itemSelected.asDriver())
    let output = viewModel.transform(input: input)
    
    // Bind categories to UITableView
    output.vacationSpots.drive(vacationSpotsTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: VacationSpotCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
    }.disposed(by: disposeBag)
    
    output.selectedVacationSpot
      .drive()
      .disposed(by: disposeBag)
  }
  @objc private func handleRefresh() {
    if #available(iOS 10.0, *) {
      vacationSpotsTableView.refreshControl!.endRefreshing()
    }
  }
}
