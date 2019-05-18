//
//  ResourceViewController+TableViewDataSource+TableViewDelegate.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit
import MessageUI.MFMailComposeViewController

extension ResourceViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel.getResourcesCount()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String.stringFromClass(ResourceDetailTableViewCell.self), for: indexPath)
    if let resource = self.viewModel.getResource(atIndex: indexPath.row) {
      (cell as? ResourceDetailTableViewCell).map {
        // setup data here
        $0.setUp(data: resource)
      }
    }
    
    return cell
  }
  
  func setUpTableView() {
    self.tableView.dataSource = self
    self.tableView.delegate = self
    self.tableView.register(ResourceDetailTableViewCell.self, bundle: Bundle.main)
    self.tableView.rowHeight = UITableView.automaticDimension;
  }
}

extension ResourceViewController: ResourceDetailTableViewCellDelegate {
  func didTapOnEmail(mailer: MFMailComposeViewController) {
    self.promise(mailer, animated: true, completion: nil)
  }
}
