//
//  MobileTestAPIError.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import Foundation

enum MobileTestAPIError: Error {
  case parsing(description: String)
  case network(description: String)
}
