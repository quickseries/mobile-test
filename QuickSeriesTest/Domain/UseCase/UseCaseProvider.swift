//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
  func makeGetResourceCategoriesUseCase() -> GetResourceCategoriesUseCase
}
