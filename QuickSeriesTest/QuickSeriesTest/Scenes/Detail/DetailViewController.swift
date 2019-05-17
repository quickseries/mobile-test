//
//  DetailViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-18.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  @IBOutlet weak var contactInfoTitleLabel: UILabel!
  @IBOutlet weak var contactInfoTableView: UITableView!
  
  @IBOutlet weak var addressesTitleLabel: UILabel!
  @IBOutlet weak var addressesTableView: UITableView!
  
  @IBOutlet weak var notesTitleLabel: UILabel!
  @IBOutlet weak var notesTableView: UITableView!
  
  @IBOutlet weak var socialMediaTitleLabel: UILabel!
  @IBOutlet weak var socialMediaCollectionView: UICollectionView!
  
  @IBOutlet weak var businessHourTitleLabel: UILabel!
  @IBOutlet weak var businessHourTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    [contactInfoTitleLabel, addressesTitleLabel, notesTitleLabel, socialMediaTitleLabel, businessHourTitleLabel].forEach { (lb) in
      lb?.font = Font(.installed(.MontserratBold), size: .standard(.h4)).instance
    }
    titleLabel.font = Font(.installed(.MontserratBold), size: .custom(30)).instance
    descriptionLabel.font = Font(.installed(.MontserratMedium), size: .standard(.h5)).instance
  }
}
