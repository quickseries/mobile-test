//
//  ServiceType.swift
//  mobileTest
//
//  Created by Balraj Singh on 13/04/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation
import PromiseKit

public protocol ServiceType {
  func fetchCatehoryDetails() -> Promise<[CategoryResponse]>
  func fetchResourceDetails(forCategory category: String) -> Promise<[ResoucesResponse]>
}
