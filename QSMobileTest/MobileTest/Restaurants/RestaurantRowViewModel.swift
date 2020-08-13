//
//  RestaurantRowViewModel.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import Foundation
import SwiftUI

struct RestaurantRowViewModel: Identifiable, Comparable {
    static func < (lhs: RestaurantRowViewModel, rhs: RestaurantRowViewModel) -> Bool {
        lhs.item.title < rhs.item.title
    }
    
    private let item: LocationJSONElement
  
    var id: String {
        item.id
    }
  
    var title: String {
        item.title
    }
  
    var fullDescription: String {
        // item.fullDescription.htmlToAttributedString ?? NSAttributedString()
        item.fullDescription
    }
  
    init(item: LocationJSONElement) {
        self.item = item
    }

}

extension RestaurantRowViewModel: Hashable {
  static func == (lhs: RestaurantRowViewModel, rhs: RestaurantRowViewModel) -> Bool {
    return lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
  }
}

