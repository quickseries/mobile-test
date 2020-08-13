//
//  CategoriesView.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
  
  @ObservedObject var viewModel: CategoriesViewModel

  init(viewModel: CategoriesViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationView {
      List {
        if viewModel.dataSource.isEmpty {
          emptySection
        } else {
          categoriesSection
        }
      }
      .listStyle(GroupedListStyle())
      .navigationBarTitle("Categories 🗂")
    }
  }

}

private extension CategoriesView {

  var categoriesSection: some View {
    Section {
        ForEach(viewModel.dataSource) { element in
            if("restaurants" == element.slug) {
                    CategoryRestaurantRowView.init(viewModel: element)
                
            } else {
                    CategoryVacationSpotRowView.init(viewModel: element)
                
            }
        }
    }
  }

  var emptySection: some View {
    Section {
      Text("No results")
        .foregroundColor(.gray)
    }
  }
}

struct CategoryRowViewModel_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = MobileTestAPIFetcher()
        let viewModel = CategoriesViewModel(mobileTestAPIFetcher: fetcher)
        let rootView = CategoriesView(viewModel: viewModel)
        return rootView
    }
}


