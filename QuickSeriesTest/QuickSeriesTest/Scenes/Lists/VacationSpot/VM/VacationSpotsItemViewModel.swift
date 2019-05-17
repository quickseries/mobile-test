//
//  VacationSpotsItemViewModel.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation
import Domain

final class VacationSpotItemViewModel {
  var title: String
  var description: String
  var backgroundImageUrl: URL?
  var response: VacationSpotNetworkModel.Response
  
  init (with response: VacationSpotNetworkModel.Response) {
    self.response = response
    self.title = response.title
    self.description = response.description ?? ""
    self.backgroundImageUrl = URL(string: response.photo)
  }
}
