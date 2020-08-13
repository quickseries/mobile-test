//
//  VacationSpotRowViewModel.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-13.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import Foundation
import SwiftUI

struct VacationSpotRowViewModel: Identifiable {
    private let item: VacationSpotJSONElement
  
    var id: String {
        item.id
    }
  
    var title: String {
        item.title
    }
  
    var fullDescription: String {
        item.fullDescription
    }
  
    init(item: VacationSpotJSONElement) {
        self.item = item
    }

}

extension VacationSpotRowViewModel: Hashable {
  static func == (lhs: VacationSpotRowViewModel, rhs: VacationSpotRowViewModel) -> Bool {
    return lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
  }
}

