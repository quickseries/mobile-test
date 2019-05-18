//
//  QuickseriesApiClient.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import Moya

public class QuickseriesApiClient : QuickseriesApi {
    
    public static let shared = QuickseriesApiClient()
    
    private let provider = MoyaProvider<Quickseries>()
    
    public func getCategories(callback: ((Outcome<[Category]>) -> ())?) {
        provider.request(.getCategories) { result in
            switch result {
            case let .success(response):
                do {
                    let categories = try response.filterSuccessfulStatusCodes().map([Category].self)
                    callback?(.success(result: categories))
                } catch (let error) {
                    callback?(.failure(error: error, reason: error.localizedDescription))
                }
            case let .failure(error):
                callback?(.failure(error: error, reason: error.localizedDescription))
            }
        }
    }
    
    public func getRestaurants(callback: ((Outcome<[Restaurant]>) -> ())?) {
        provider.request(.getRestaurants) { result in
            switch result {
            case let .success(response):
                do {
                    let categories = try response.filterSuccessfulStatusCodes().map([Restaurant].self)
                    callback?(.success(result: categories))
                } catch (let error) {
                    callback?(.failure(error: error, reason: error.localizedDescription))
                }
            case let .failure(error):
                callback?(.failure(error: error, reason: error.localizedDescription))
            }
        }
    }
    
    public func getVacationSpots(callback: ((Outcome<[VacationSpot]>) -> ())?) {
        provider.request(.getVacationSpots) { result in
            switch result {
            case let .success(response):
                do {
                    let categories = try response.filterSuccessfulStatusCodes().map([VacationSpot].self)
                    callback?(.success(result: categories))
                } catch (let error) {
                    callback?(.failure(error: error, reason: error.localizedDescription))
                }
            case let .failure(error):
                callback?(.failure(error: error, reason: error.localizedDescription))
            }
        }
    }
}
