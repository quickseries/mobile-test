//
//  HomeScreenViewController.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
  
  let categoryViewModel = CategoryViewModel(usecase: CategoryUsecase(service: AppEnvironment.current.apiService))
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Select a category"
    
    self.setupTableView()
    // Do any additional setup after loading the view.
    Loader.show(blockingLoader: false)
    _ = self.categoryViewModel.loadCategories()
      .done { _ in self.tableView.reloadData() }
      .tap { _ in Loader.hide() }
  }
}
