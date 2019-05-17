//
//  VacationSpotsViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

class VacationSpotsViewController: UIViewController {
  @IBOutlet weak var vacationSpotsTableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  private func setupUI() {
    navigationItem.title = NavigationTitles.vacationSpots.rawValue
  }
}
