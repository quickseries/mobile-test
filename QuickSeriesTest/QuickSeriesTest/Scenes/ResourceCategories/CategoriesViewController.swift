//
//  CategoriesViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

class ResourceCategoriesViewController: UIViewController {
  var viewModel: ResourceCategoriesViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = NavigationTitles.categories.rawValue
  }
}
