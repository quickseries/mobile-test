//
//  VacationSpotsViewModel.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-13.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import SwiftUI
import Combine

class VacationSpotsViewModel: ObservableObject, Identifiable {

    
    @Published var dataSource: [VacationSpotRowViewModel] = []
    public var catalogSelected: CategoryJSONElement
    private let mobileTestAPIFetcher: MobileTestAPIFetchable?
    
    private var disposables = Set<AnyCancellable>()
    
    init(catalogSelected: CategoryJSONElement, mobileTestAPIFetcher: MobileTestAPIFetchable?,
         scheduler: DispatchQueue = DispatchQueue(label: "VacationSpotsViewModel", qos: .background)
    ) {
        self.mobileTestAPIFetcher = mobileTestAPIFetcher
        self.catalogSelected = catalogSelected
        scheduler.async { self.fetchVacationSpots() }
    }
    
    func fetchVacationSpots() {
        self.mobileTestAPIFetcher?.vacationSpots()
            .map { response  in
                response.map(VacationSpotRowViewModel.init)
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
