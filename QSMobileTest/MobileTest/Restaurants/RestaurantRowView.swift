//
//  RestaurantRowView.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI

struct RestaurantRowView: View {
    private let viewModel: RestaurantRowViewModel
    
    init(viewModel: RestaurantRowViewModel) {
        self.viewModel = viewModel
    }
  
    var body: some View {
        NavigationLink(destination: RestaurantDetailView()) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(viewModel.title)")
                        .font(.body)
                    Text("\(viewModel.fullDescription)")
                        .font(.footnote)
                }.padding(.leading, 8)

            }
        }
    }
}
