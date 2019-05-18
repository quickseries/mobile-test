//
//  RestaurantsNavigator.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import Domain

protocol RestaurantsNavigatorProtocol {
  func toRestaurant(_ restaurant: RestaurantItemViewModel)
  func setup(_ vc: RestaurantsViewController)
}

class RestaurantsNavigator: RestaurantsNavigatorProtocol {
  private let navigationController: UINavigationController
  private let services: UseCaseProvider
  
  init(services: UseCaseProvider, navigationController: UINavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toRestaurant(_ restaurant: RestaurantItemViewModel) {
    let detailVC = DetailViewController(nibName: XibNames.detail.rawValue, bundle: nil)
    detailVC.restaurantViewModel = RestaurantDetailViewModel(restaurantItem: restaurant)
    navigationController.pushViewController(detailVC, animated: true)
  }
  func setup(_ vc: RestaurantsViewController) {
    vc.viewModel = RestaurantsViewModel(navigator: self, useCase: services.makeGetRestaurantsUseCase())
  }
}
