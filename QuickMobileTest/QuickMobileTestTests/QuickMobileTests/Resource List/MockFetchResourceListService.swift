//
//  MockFetchResourceListService.swift
//  QuickMobileTestTests
//
//  Created by Balaji Galave on 5/19/19.
//

import Foundation
@testable import QuickMobileTest

class MockFetchResourceListService: FetchResourceListService {
    
    func fetchResourceList(for type: CategoryType, completion: @escaping CompletionResourceResponse) {
        let stubGenerator = StubGenerator()
        
        
        switch type {
        case .restaurant:
            if let data = stubGenerator.getRestaurantsData() {
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseModel = try jsonDecoder.decode([ResourceResponse].self, from: data)
                    
                    completion(.success(responseModel))
                    
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        case .vacationSpots:
            if let data = stubGenerator.getVacationSpotData() {
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseModel = try jsonDecoder.decode([ResourceResponse].self, from: data)
                    
                    completion(.success(responseModel))
                    
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }
        
        
    }
}
