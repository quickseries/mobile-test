//
//  CategoryItemViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import Domain

final class CategoryItemViewModel {
  var title: String
  var description: String
  var slugType: CategoryNetworkModel.SlugType
  var response: CategoryNetworkModel.Response
  
  init (with response: CategoryNetworkModel.Response) {
    self.response = response
    self.title = response.title
    self.slugType = CategoryNetworkModel.SlugType(rawValue: response.slug) ?? .restaurant
    self.description = response.description ?? ""
  }
}
