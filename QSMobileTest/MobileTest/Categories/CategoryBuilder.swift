//
//  CategoryBuilder.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI

enum CategoryBuilder {
    static func makeRestaurantsView(
        catalogSelected: CategoryJSONElement,
        mobileTestAPIFetcher: MobileTestAPIFetchable?
    ) -> some View {
        let viewModel = RestaurantsViewModel(
            catalogSelected: catalogSelected,
            mobileTestAPIFetcher: mobileTestAPIFetcher)
        return RestaurantsView(viewModel: viewModel)
    }
    
    static func makeVacationSpotsView(
        catalogSelected: CategoryJSONElement,
        mobileTestAPIFetcher: MobileTestAPIFetchable?
    ) -> some View {
        let viewModel = VacationSpotsViewModel(
            catalogSelected: catalogSelected,
            mobileTestAPIFetcher: mobileTestAPIFetcher)
        return VacationSpotsView(viewModel: viewModel)
    }
}
