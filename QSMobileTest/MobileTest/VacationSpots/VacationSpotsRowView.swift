//
//  VacationSpotsRowView.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-13.
//  Copyright © 2020 Quick Series. All rights reserved.
//


import SwiftUI

struct VacationSpotRowView: View {
    private let viewModel: VacationSpotRowViewModel
    
    init(viewModel: VacationSpotRowViewModel) {
        self.viewModel = viewModel
    }
  
    var body: some View {
        NavigationLink(destination: ContentView()) {
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
