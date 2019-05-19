//
//  QuickSeriesApi.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public protocol QuickseriesApi {
    
    func getCategories(callback: ((Outcome<[Category]>) -> ())?)
    
    func getRestaurants(callback: ((Outcome<[Restaurant]>) -> ())?)
    
    func getVacationSpots(callback: ((Outcome<[VacationSpot]>) -> ())?)
}
