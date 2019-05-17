//
//  ResourceViewController.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {
  
  let viewModel: ResourcesViewModel
  
  @IBOutlet weak var tableView: UITableView!
  public init(forCategory category: String) {
    self.viewModel = ResourcesViewModel(withCategory: category, withUsecase: ResourcesUsecase(service: AppEnvironment.current.apiService))
    super.init(nibName: String.stringFromClass(ResourceViewController.self), bundle: Bundle.main)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.title = self.viewModel.selectedCategory
    self.setUpRightNavigationBarButton()
    self.setUpTableView()
    Loader.show(blockingLoader: false)
    _ = self.viewModel.loadResource()
      .done { _ in self.tableView.reloadData() }
      .tap { _ in Loader.hide() }
  }
  
  func setUpRightNavigationBarButton() {
    let saveReport = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(sortItemsTap))
    self.navigationItem.rightBarButtonItem = saveReport
  }
  
  @objc func sortItemsTap() {
    self.viewModel.sortResources()
    self.tableView.reloadData()
  }
}
