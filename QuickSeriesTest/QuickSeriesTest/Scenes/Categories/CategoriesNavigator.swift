//
//  CategoriesNavigator.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import Domain

protocol CategoriesNavigatorProtocol {
  func toWhichCategory(_ categoryType: CategoryNetworkModel.SlugType)
  func toRestaurants()
  func toVacationSpots()
  func setup(_ viewController: CategoriesViewController)
}

class CategoriesNavigator: CategoriesNavigatorProtocol {

  private let navigationController: UINavigationController
  private let services: UseCaseProvider
  
  init(services: UseCaseProvider, navigationController: UINavigationController) {
    self.services = services
    self.navigationController = navigationController
  }
  func toWhichCategory(_ categoryType: CategoryNetworkModel.SlugType) {
    switch categoryType {
    case .restaurant:
      toRestaurants()
    case .vacationSpot:
      toVacationSpots()
    }
  }
  func toRestaurants() {
    let restaurantsVC = RestaurantsViewController(nibName: XibNames.restaurants.rawValue, bundle: nil)
    let restaurantsNavigator = RestaurantsNavigator(services: services, navigationController: navigationController)
    restaurantsNavigator.setup(restaurantsVC)
    navigationController.pushViewController(restaurantsVC, animated: true)
  }
  func toVacationSpots() {
    let vacationSpotsVC = VacationSpotsViewController(nibName: XibNames.vacationSpots.rawValue, bundle: nil)
    let vacationSpotsNavigator = VacationSpotsNavigator(services: services, navigationController: navigationController)
    vacationSpotsNavigator.setup(vacationSpotsVC)
    navigationController.pushViewController(vacationSpotsVC, animated: true)
  }
  func setup(_ viewController: CategoriesViewController) {
    let vm = CategoriesViewModel(navigator: self, useCase: services.makeGetCategoriesUseCase())
    viewController.viewModel = vm
  }
}
