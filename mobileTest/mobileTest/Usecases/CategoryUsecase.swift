//
//  CategoryUsecase.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation
import PromiseKit

public struct CategoryUsecase: CategoryUsecaseProtocol {
  let categoryService: ServiceType
  
  init(service: ServiceType) {
    self.categoryService = service
  }
  
  public func getCategory() -> Promise<[CategoryResponse]> {
    return self.categoryService.fetchCatehoryDetails()
  }
}

public protocol CategoryUsecaseProtocol {
  func getCategory() -> Promise<[CategoryResponse]>
}
