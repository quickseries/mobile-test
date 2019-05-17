//
//  VacationSpotsViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

final class VacationSpotsViewModel: ViewModelType {
  
  private let navigator: VacationSpotsNavigator
  private let useCase: Domain.GetVacationSpotsUseCase
  private let activityIndicator = ActivityIndicator()
  private let errorTracker = ErrorTracker()
  
  init(navigator: VacationSpotsNavigator, useCase: Domain.GetVacationSpotsUseCase) {
    self.useCase = useCase
    self.navigator = navigator
  }
  
  func transform(input: VacationSpotsViewModel.Input) -> VacationSpotsViewModel.Output {
    let fetching = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    
    let vacationSpots = getVacationSpots(activityIndicator: activityIndicator, error: errorTracker)
    
    let selectedVacationSpot = input.selection
      .withLatestFrom(vacationSpots) { (indexPath, categories) -> VacationSpotItemViewModel in
        return categories[indexPath.row]
      }.do(onNext: { [unowned self] (vacationSpot) in
        self.navigator.toVacationSpot(vacationSpot)
      })
    return Output(vacationSpots: vacationSpots, isFetching: fetching, selectedVacationSpot: selectedVacationSpot, error: errors)
  }
  
  func getVacationSpots(activityIndicator: ActivityIndicator, error: ErrorTracker) -> Driver<[VacationSpotItemViewModel]> {
    let reqParam = VacationSpotNetworkModel.Request(languageId: 0)
    return self.useCase.getVacationSpots(requestParameter: reqParam)
      .trackActivity(activityIndicator)
      .trackError(errorTracker)
      .asDriverOnErrorJustComplete()
      .map { $0.map { VacationSpotItemViewModel(with: $0) } }
  }
}

extension VacationSpotsViewModel {
  struct Input {
    let selection: Driver<IndexPath>
  }
  
  struct Output {
    let vacationSpots: Driver<[VacationSpotItemViewModel]>
    let isFetching: Driver<Bool>
    let selectedVacationSpot: Driver<VacationSpotItemViewModel>
    let error: Driver<Error>
  }
}
