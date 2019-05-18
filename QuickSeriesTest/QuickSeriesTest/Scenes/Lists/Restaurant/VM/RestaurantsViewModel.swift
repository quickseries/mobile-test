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
  private let useCase: Domain.GetRestaurantsUseCase
  private let activityIndicator = ActivityIndicator()
  private let errorTracker = ErrorTracker()
  private var defaultAtoZ = false
  init(navigator: RestaurantsNavigator, useCase: Domain.GetRestaurantsUseCase) {
    self.useCase = useCase
    self.navigator = navigator
  }
  
  func transform(input: RestaurantsViewModel.Input) -> RestaurantsViewModel.Output {
    let fetching = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    
    let response = getRestaurants(activityIndicator: activityIndicator, error: errorTracker)
    
    let temp = input.sortButtonTrigger.withLatestFrom(response).map { [unowned self] (items) -> [RestaurantItemViewModel] in
      self.defaultAtoZ = !self.defaultAtoZ
      if self.defaultAtoZ {
        return items.sorted { $0.title < $1.title }
      }
      
      return items.sorted { $0.title > $1.title }
    }
    let sortedRestaurants = Driver.merge(response, temp)
    
    let isAtoZ = input.sortButtonTrigger.map{[unowned self] in
      return self.defaultAtoZ
    }

    let selectedRestaurant = input.selection
      .withLatestFrom(response) { (indexPath, restaurants) -> RestaurantItemViewModel in
        return restaurants[indexPath.row]
      }.do(onNext: { [unowned self] (restaurant) in
        self.navigator.toRestaurant(restaurant)
      })
    return Output(restaurants: sortedRestaurants, response: response.mapToVoid(), isFetching: fetching, selectedRestaurant: selectedRestaurant, error: errors, isAtoZ: isAtoZ)
  }
  
  func getRestaurants(activityIndicator: ActivityIndicator, error: ErrorTracker) -> Driver<[RestaurantItemViewModel]> {
    let reqParam = RestaurantNetworkModel.Request(languageId: 0)
    return self.useCase.getRestaurants(requestParameter: reqParam)
      .trackActivity(activityIndicator)
      .trackError(errorTracker)
      .asDriverOnErrorJustComplete()
      .map { $0.map { RestaurantItemViewModel(with: $0) } }
  }
}

extension RestaurantsViewModel {
  struct Input {
    let selection: Driver<IndexPath>
    let sortButtonTrigger: Driver<Void>
  }
  
  struct Output {
    let restaurants: Driver<[RestaurantItemViewModel]>
    let response: Driver<Void>
    let isFetching: Driver<Bool>
    let selectedRestaurant: Driver<RestaurantItemViewModel>
    let error: Driver<Error>
    let isAtoZ: Driver<Bool>
  }
}
