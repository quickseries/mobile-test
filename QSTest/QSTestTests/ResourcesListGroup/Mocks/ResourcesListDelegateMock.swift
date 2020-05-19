//
//  ResourcesListDelegateMock.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class ResourcesListDelegateMock: ResourcesListPresenterDelegate {
    private(set) var didSelectRestaurant = false
    private(set) var didSelectVacationSpot = false
    
    private(set) var restaurant: Restaurant?
    private(set) var vacationSpot: VacationSpot?
    
    func presenter(_ presenter: ResourcesListPresenterProtocol, didSelect restaurant: Restaurant) {
        didSelectRestaurant = true
        self.restaurant = restaurant
    }
    
    func presenter(_ presenter: ResourcesListPresenterProtocol, didSelect vacationSpot: VacationSpot) {
        didSelectVacationSpot = true
        self.vacationSpot = vacationSpot
    }
}
