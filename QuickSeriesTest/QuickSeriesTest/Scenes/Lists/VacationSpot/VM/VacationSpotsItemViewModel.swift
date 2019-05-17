//
//  VacationSpotsItemViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import Domain

final class VacationSpotsItemViewModel {
  var title: String
  var description: String
  var response: VacationSpotsItemViewModel.Response
  
  init (with response: RestaurantNetworkModel.Response) {
    self.response = response
    self.title = response.title
    self.description = response.description ?? ""
  }
}
