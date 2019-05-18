//
//  QuickseriesApiClient.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public class QuickseriesApiClient : QuickseriesApi {
    
    public static let shared = QuickseriesApiClient()
    
    public func getCategories(callback: ((Outcome<[Category]>) -> ())?) {
    
    }
    
    public func getRestaurants(callback: ((Outcome<[Restaurant]>) -> ())?) {
        
    }
    
    public func getVacationSpots(callback: ((Outcome<[VacationSpot]>) -> ())?) {
        
    }
}
