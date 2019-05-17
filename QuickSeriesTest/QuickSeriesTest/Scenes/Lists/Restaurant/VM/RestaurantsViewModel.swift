//
//  RestaurantsViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

final class RestaurantsViewModel: ViewModelType {
  
  private let navigator: RestaurantsNavigator
  private let useCase: Domain.GetCategoriesUseCase
  private let activityIndicator = ActivityIndicator()
  private let errorTracker = ErrorTracker()
  
  init(navigator: CategoriesNavigator, useCase: Domain.GetCategoriesUseCase) {
    self.useCase = useCase
    self.navigator = navigator
  }
}

extension RestaurantsViewModel {
  struct Input {
    let selection: Driver<IndexPath>
  }
  
  struct Output {
    let restaurants: Driver<[RestaurantsItemViewModel]>
    let isFetching: Driver<Bool>
    let selectedCategory: Driver<RestaurantsItemViewModel>
    let error: Driver<Error>
  }
}
