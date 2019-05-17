//
//  ResourceCategoriesViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

final class CategoriesViewModel: ViewModelType {
  
  private let navigator: CategoriesNavigator
  private let useCase: Domain.GetCategoriesUseCase
  private let activityIndicator = ActivityIndicator()
  private let errorTracker = ErrorTracker()
  
  init(navigator: CategoriesNavigator, useCase: Domain.GetCategoriesUseCase) {
    self.useCase = useCase
    self.navigator = navigator
  }
  
  func transform(input: Input) -> Output {
    let fetching = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    
    let categories = getCategories(activityIndicator: activityIndicator, error: errorTracker)
    
    let selectedCategory = input.selection
      .withLatestFrom(categories) { (indexPath, categories) -> CategoryItemViewModel in
        return categories[indexPath.row]
      }.do(onNext: { [unowned self] (category) in
        self.navigator.toWhichCategory(category.slugType)
      })
    return Output(categories: categories, isFetching: fetching, selectedCategory: selectedCategory, error: errors)
  }
  func getCategories(activityIndicator: ActivityIndicator, error: ErrorTracker) -> Driver<[CategoryItemViewModel]> {
    let reqParam = CategoryNetworkModel.Request(languageId: 0)
    return self.useCase.getCategories(requestParameter: reqParam)
      .trackActivity(activityIndicator)
      .trackError(errorTracker)
      .asDriverOnErrorJustComplete()
      .map { $0.map { CategoryItemViewModel(with: $0) } }
  }
  func retry() {
    
  }
}
extension CategoriesViewModel {
  struct Input {
    let selection: Driver<IndexPath>
  }
  
  struct Output {
    let categories: Driver<[CategoryItemViewModel]>
    let isFetching: Driver<Bool>
    let selectedCategory: Driver<CategoryItemViewModel>
    let error: Driver<Error>
  }
}
