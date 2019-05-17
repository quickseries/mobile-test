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
  func toRestaurant(_ restaurant: RestaurantsItemViewModel)
  func setup()
}

class RestaurantsNavigator: RestaurantsNavigatorProtocol {
  private let navigationController: UINavigationController
  private let services: UseCaseProvider
  
  init(services: UseCaseProvider, navigationController: UINavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  
  func toRestaurant(_ restaurant: RestaurantsItemViewModel) {
    
  }
  func setup() {
    
  }
}
