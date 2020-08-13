//
//  RestaurantsView.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI

struct RestaurantsView: View {
      
    @ObservedObject var viewModel: RestaurantsViewModel

    init(viewModel: RestaurantsViewModel) {
        self.viewModel = viewModel
    }
      
    var body: some View {
        List {
            if viewModel.dataSource.isEmpty {
                emptySection
            } else {
                restaurantsSection
            }
        }
        .navigationBarItems(trailing:
            HStack {
                Button("Sort") { self.viewModel.sort() }
            }
        )
        .listStyle(GroupedListStyle())
        .navigationBarTitle("🍳\(viewModel.catalogSelected.title ?? "Restorante")")
    }
}

private extension RestaurantsView {

    var restaurantsSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: RestaurantRowView.init(viewModel:))
        }
    }

    var emptySection: some View {
        Section {
          Text("No results")
            .foregroundColor(.gray)
        }
    }
}

