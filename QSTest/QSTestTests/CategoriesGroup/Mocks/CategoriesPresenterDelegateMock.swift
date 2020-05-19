//
//  CategoriesPresenterDelegateMock.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class CategoriesPresenterDelegateMock: CategoriesPresenterDelegate {
    private(set) var didSelectRestaurants = false
    private(set) var didSelectVacationSpots = false
    
    private(set) var restaurants: Restaurants?
    private(set) var vacationSpots: VacationSpots?
    
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect restaurants: Restaurants) {
        didSelectRestaurants = true
        self.restaurants = restaurants
    }
    
    func presenter(_ presenter: CategoriesPresenterProtocol, didSelect vacationSpots: VacationSpots) {
        didSelectVacationSpots = true
        self.vacationSpots = vacationSpots
    }
}
