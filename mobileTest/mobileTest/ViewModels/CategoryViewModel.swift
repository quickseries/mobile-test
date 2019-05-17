//
//  CategoryViewModel.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation
import PromiseKit

public class CategoryViewModel {
  private var categoryModel: [(title: String, description: String)]?
  
  private let categoryUsecase: CategoryUsecaseProtocol
  
  init(usecase: CategoryUsecaseProtocol) {
    self.categoryUsecase = usecase
  }
  
  public func loadCategories() -> Promise<Bool> {
    return self.categoryUsecase.getCategory().map { data in
      self.categoryModel = data.map { value -> (title: String, description: String) in
        return (value.title, value.description ?? "")
      }
      return true }
  }
  
  public func getTotalCategoryCount() -> Int {
    return self.categoryModel?.count ?? 0
  }
  
  public func getCategory(forIndex index: Int) -> (title: String, description: String)? {
    return self.categoryModel?[index]
  }
}
