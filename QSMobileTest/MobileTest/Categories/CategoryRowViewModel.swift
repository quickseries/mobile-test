//
//  CategoryRowViewModel.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import Foundation
import SwiftUI

struct CategoryRowViewModel: Identifiable {
    private let item: CategoryJSONElement
    private let mobileTestAPIFetcher: MobileTestAPIFetchable?

    var id: String {
        item.id ?? UUID().uuidString
    }
  
    var title: String {
        item.title ?? ""
    }
    
    var slug: String {
        item.slug ?? ""
    }
  
    var fullDescription: String {
        item.fullDescription ?? ""
    }
  
    init(item: CategoryJSONElement, mobileTestAPIFetcher: MobileTestAPIFetchable?) {
        self.item = item
        self.mobileTestAPIFetcher = mobileTestAPIFetcher
    }
}

extension CategoryRowViewModel: Hashable {
    static func == (lhs: CategoryRowViewModel, rhs: CategoryRowViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}


extension CategoryRowViewModel {
    var restaurantsView: some View {
        return CategoryBuilder.makeRestaurantsView(
            catalogSelected: self.item,
            mobileTestAPIFetcher: self.mobileTestAPIFetcher
        )
    }
    
    var vacationSpots: some View {
      return CategoryBuilder.makeVacationSpotsView(
        catalogSelected: self.item,
        mobileTestAPIFetcher: self.mobileTestAPIFetcher
      )
    }
}

