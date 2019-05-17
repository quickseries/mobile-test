//
//  RestaurantViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {
  @IBOutlet weak var restaurantsTableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  private func setupUI() {
    navigationItem.title = NavigationTitles.restaurants.rawValue
  }
}
