//
//  RestaurantsViewModel.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI
import Combine

class RestaurantsViewModel: ObservableObject, Identifiable {

    
    @Published var dataSource: [RestaurantRowViewModel] = []
    let catalogSelected: CategoryJSONElement
    private let mobileTestAPIFetcher: MobileTestAPIFetchable?
    private var sortAscending = true
    private var scheduler: DispatchQueue
    
    private var disposables = Set<AnyCancellable>()
    
    init(catalogSelected: CategoryJSONElement, mobileTestAPIFetcher: MobileTestAPIFetchable?,
         scheduler: DispatchQueue = DispatchQueue(label: "RestaurantsViewModel", qos: .userInitiated)
    ) {
        self.mobileTestAPIFetcher = mobileTestAPIFetcher
        self.catalogSelected = catalogSelected
        self.scheduler = scheduler
        scheduler.async { self.fetchRestaurants() }
    }
    
    func fetchRestaurants() {
        self.mobileTestAPIFetcher?.restaurants()
            .map { response  in
                response.map(RestaurantRowViewModel.init)
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
    
    func sort() {
        print("sort")
        guard dataSource.count > 0 else { return }
        scheduler.async {
            let dataSorted = self.dataSource.sorted { self.sortAscending ? $0.title < $1.title : $0.title > $1.title }
            self.sortAscending = !self.sortAscending
            DispatchQueue.main.async {
                self.dataSource = dataSorted
            }
        }
        
     }

}
