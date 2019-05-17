//
//  ResourcesViewModel.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation

public class ResourcesViewModel {
  let usecase: ResourcesUsecaseProtocol
  let selectedCategory: String
  
  init(withCategory category: String, withUsecase usecase: ResourcesUsecaseProtocol) {
    self.usecase = usecase
    self.selectedCategory = category
  }
  
  
}
