//
//  CategoriesViewModel.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI
import Combine

class CategoriesViewModel: ObservableObject, Identifiable {

    @Published var dataSource: [CategoryRowViewModel] = []
    private let mobileTestAPIFetcher: MobileTestAPIFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(mobileTestAPIFetcher: MobileTestAPIFetchable,
         scheduler: DispatchQueue = DispatchQueue(label: "CategoriesViewModel", qos: .userInitiated)
    ) {
        self.mobileTestAPIFetcher = mobileTestAPIFetcher
        scheduler.async { self.fetchCategories() }
    }
    
    func fetchCategories() {
        self.mobileTestAPIFetcher.categories()
            .map { response  in
                response.map { [weak self] element in
                    return CategoryRowViewModel(item: element, mobileTestAPIFetcher: self?.mobileTestAPIFetcher)
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                self.dataSource = forecast
            }).store(in: &disposables)
    }

}

