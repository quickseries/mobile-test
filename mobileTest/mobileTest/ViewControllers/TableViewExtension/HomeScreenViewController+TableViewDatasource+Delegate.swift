//
//  HomeScreenViewController+TableViewDatasource+Delegate.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit

extension HomeScreenViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String.stringFromClass(HomeScreenCategoriesTableViewCell.self), for: indexPath)
    if let category = self.categoryViewModel.getCategory(forIndex: indexPath.row) {
      (cell as? HomeScreenCategoriesTableViewCell).map {
        // setup data here
        $0.setUp(data: category)
      }
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.categoryViewModel.getTotalCategoryCount()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let resourceViewController = indexPath.row
    |> self.categoryViewModel.getCategory(forIndex:)
    |> { categoryData -> String in categoryData?.title ?? "restaurants" }
    |> ResourceViewController.init(forCategory:)
    
    self.navigationController?.pushViewController(resourceViewController, animated: true)
  }
  
  func setupTableView() {
    self.tableView.register(HomeScreenCategoriesTableViewCell.self, bundle: Bundle.main)
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.rowHeight = UITableView.automaticDimension;
  }
}
