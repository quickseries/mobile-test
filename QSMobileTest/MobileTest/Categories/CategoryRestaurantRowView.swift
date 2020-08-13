//
//  RestaurantRowView.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI

struct CategoryRestaurantRowView: View {
    private let viewModel: CategoryRowViewModel
    
    init(viewModel: CategoryRowViewModel) {
        self.viewModel = viewModel
    }
  
    var body: some View {
        NavigationLink(destination: self.viewModel.restaurantsView) {

            HStack {
                VStack(alignment: .leading) {
                    Text("🍳\(viewModel.title)")
                        .font(.body)
                    Text("\(viewModel.fullDescription)")
                        .font(.footnote)
                }.padding(.leading, 8)

            }
        }
    }
}

