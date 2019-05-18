//
//  DetailViewController.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-18.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  @IBOutlet weak var contactInfoTitleLabel: UILabel!
  @IBOutlet weak var contactInfoTableView: UITableView!
  @IBOutlet weak var contactInfoTableViewHeightAnchor: NSLayoutConstraint!

  @IBOutlet weak var addressesTitleLabel: UILabel!
  @IBOutlet weak var addressesTableView: UITableView!
  @IBOutlet weak var addressesTableViewHeightAnchor: NSLayoutConstraint!
  
  @IBOutlet weak var socialMediaTitleLabel: UILabel!
  @IBOutlet weak var socialMediaCollectionView: UICollectionView!
  @IBOutlet weak var socialMediaCollectionViewHeightAnchor: NSLayoutConstraint!

  @IBOutlet weak var businessHourTitleLabel: UILabel!
  @IBOutlet weak var businessHourTableView: UITableView!
  
  var restaurantViewModel: RestaurantDetailViewModel?
  var vacationSpotViewModel: VacationSpotDetailViewModel?

  private let disposeBag = DisposeBag()

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    configureTableView()
    setViewModel()
  }
  fileprivate func setViewModel() {
    if let restViewModel = restaurantViewModel {
      bindRestaurantModel(restViewModel)
    } else {
      if let vacVM = vacationSpotViewModel {
        bindVacationSpotModel(vacVM)
      }
    }
  }
  private func configureTableView() {
    addressesTableView.rowHeight = 130
    let addressCellNib = UINib(nibName: XibNames.addressCell.rawValue, bundle: nil)
    addressesTableView.register(addressCellNib, forCellReuseIdentifier: CellIds.cellId.rawValue)
    
    contactInfoTableView.rowHeight = 80
    let contactInfoCellNib = UINib(nibName: XibNames.contactInfoCell.rawValue, bundle: nil)
    contactInfoTableView.register(contactInfoCellNib, forCellReuseIdentifier: CellIds.cellId.rawValue)
    
    let socialMediaCellNib = UINib(nibName: XibNames.socialMediaCell.rawValue, bundle: nil)
    socialMediaCollectionView.register(socialMediaCellNib, forCellWithReuseIdentifier: CellIds.cellId.rawValue)
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 60, height: 60)
    layout.sectionInset = UIEdgeInsets(top: 10, left: 12, bottom: 0, right: 0)
    socialMediaCollectionView.setCollectionViewLayout(layout, animated: false)
    
    businessHourTableView.rowHeight = 50
    let businessHourCellNib = UINib(nibName: XibNames.businessHourCell.rawValue, bundle: nil)
    businessHourTableView.register(businessHourCellNib, forCellReuseIdentifier: CellIds.cellId.rawValue)
  }
  private func bindRestaurantModel(_ restVM: RestaurantDetailViewModel) {
    let input = RestaurantDetailViewModel.Input()
    let output = restVM.transform(input: input)
    addressesTableViewHeightAnchor.constant = output.addressHeight
    contactInfoTableViewHeightAnchor.constant = output.contactInfoHeight
    socialMediaCollectionViewHeightAnchor.constant = output.socialMediaHeight
    addressesTitleLabel.isHidden = output.addressHeight > 0 ? false : true
    socialMediaTitleLabel.isHidden = output.socialMediaHeight > 0 ? false : true
    contactInfoTitleLabel.isHidden = output.contactInfoHeight > 0 ? false : true
    
    output.adressItems.drive(addressesTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: AddressCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
    }.disposed(by: disposeBag)
    
    output.contactInfoItems.drive(contactInfoTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: ContactInfoCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
    }.disposed(by: disposeBag)
    
    
    output.businessOur.drive(businessHourTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: BusinessHourCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
    }.disposed(by: disposeBag)
    
    output.socialMediaItems.drive(socialMediaCollectionView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: SocialMediaCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
    }.disposed(by: disposeBag)
    
    output.title.drive(titleLabel.rx.text).disposed(by: disposeBag)
    output.description.drive(descriptionLabel.rx.attributedText).disposed(by: disposeBag)
  }
  private func bindVacationSpotModel(_ vacVM: VacationSpotDetailViewModel) {
    let input = VacationSpotDetailViewModel.Input()
    let output = vacVM.transform(input: input)
    addressesTableViewHeightAnchor.constant = output.addressHeight
    contactInfoTableViewHeightAnchor.constant = output.contactInfoHeight
    socialMediaCollectionViewHeightAnchor.constant = output.socialMediaHeight
    addressesTitleLabel.isHidden = output.addressHeight > 0 ? false : true
    socialMediaTitleLabel.isHidden = output.socialMediaHeight > 0 ? false : true
    contactInfoTitleLabel.isHidden = output.contactInfoHeight > 0 ? false : true

    output.adressItems.drive(addressesTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: AddressCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
      }.disposed(by: disposeBag)
    
    output.contactInfoItems.drive(contactInfoTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: ContactInfoCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
      }.disposed(by: disposeBag)
    
    
    output.businessOur.drive(businessHourTableView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: BusinessHourCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
      }.disposed(by: disposeBag)
    
    output.socialMediaItems.drive(socialMediaCollectionView.rx.items(cellIdentifier: CellIds.cellId.rawValue, cellType: SocialMediaCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
      }.disposed(by: disposeBag)
    
    output.title.drive(titleLabel.rx.text).disposed(by: disposeBag)
    output.description.drive(descriptionLabel.rx.attributedText).disposed(by: disposeBag)
  }
  private func setupUI() {
    [contactInfoTitleLabel, addressesTitleLabel, socialMediaTitleLabel, businessHourTitleLabel].forEach { (lb) in
      lb?.font = Font(.installed(.MontserratBold), size: .standard(.h4)).instance
    }
    titleLabel.font = Font(.installed(.MontserratBold), size: .custom(30)).instance
    descriptionLabel.font = Font(.installed(.MontserratMedium), size: .standard(.h5)).instance
  }
}
