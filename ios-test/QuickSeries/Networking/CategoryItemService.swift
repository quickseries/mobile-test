//  ResourceService.swift
//  QuickSeries
//
//  Created by Franck Clement on 05/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import Foundation

struct ResourceService: NetService {
    
    typealias Item = [Resource]
    
    let session: URLSession = .shared
    let url: URL
    let itemType: CategoryType

    init(itemType: CategoryType) {
        self.itemType = itemType
        switch self.itemType {
        case .restaurant:
            url = URL(string: "https://raw.githubusercontent.com/franckclement/mobile-test/ios-test-franck-clement/data/restaurants.json")!
        case .vacationSpot:
            url = URL(string: "https://raw.githubusercontent.com/franckclement/mobile-test/ios-test-franck-clement/data/vacation-spot.json")!
        }
    }
}
