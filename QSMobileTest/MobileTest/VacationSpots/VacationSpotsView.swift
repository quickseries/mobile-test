//
//  VacationSpotsView.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-13.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI

struct VacationSpotsView: View {
      
      @ObservedObject var viewModel: VacationSpotsViewModel

      init(viewModel: VacationSpotsViewModel) {
        self.viewModel = viewModel
      }
      
      var body: some View {
          List {
            if viewModel.dataSource.isEmpty {
              emptySection
            } else {
              vacationSpotsSection
            }
          }
          .listStyle(GroupedListStyle())
          .navigationBarTitle("🏖Vacation Spots")
      }

    }

private extension VacationSpotsView {

    var vacationSpotsSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: VacationSpotRowView.init(viewModel:))
        }
    }

    var emptySection: some View {
        Section {
          Text("No results")
            .foregroundColor(.gray)
        }
    }
}
