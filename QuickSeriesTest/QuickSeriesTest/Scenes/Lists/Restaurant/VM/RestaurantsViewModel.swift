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
  
  init(navigator: RestaurantsNavigator, useCase: Domain.GetRestaurantsUseCase) {
    self.useCase = useCase
    self.navigator = navigator
  }
  
  func transform(input: RestaurantsViewModel.Input) -> RestaurantsViewModel.Output {
    let fetching = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    
    var restaurants = getRestaurants(activityIndicator: activityIndicator, error: errorTracker)
    
    let sortedRestaurants = input.sortButtonTrigger
      .withLatestFrom(restaurants) { (isAtoZ, restaurants) -> [RestaurantItemViewModel] in
        return restaurants.sorted { $0.title < $1.title }
    }.do(onNext: { (sortedRestaurants) in
      restaurants = Driver.of(sortedRestaurants)
    })
    let selectedRestaurant = input.selection
      .withLatestFrom(restaurants) { (indexPath, restaurants) -> RestaurantItemViewModel in
        return restaurants[indexPath.row]
      }.do(onNext: { [unowned self] (restaurant) in
        self.navigator.toRestaurant(restaurant)
      })
    return Output(restaurants: restaurants, isFetching: fetching, selectedRestaurant: selectedRestaurant, error: errors)
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
    let isAtoZ: BehaviorRelay<Bool>
  }
  
  struct Output {
    let restaurants: Driver<[RestaurantItemViewModel]>
    let isFetching: Driver<Bool>
    let selectedRestaurant: Driver<RestaurantItemViewModel>
    let error: Driver<Error>
  }
}
