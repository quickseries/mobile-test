//
//  MockFetchCategoryListService.swift
//  QuickMobileTestTests
//
//  Created by Balaji Galave on 5/19/19.
//

import Foundation
@testable import QuickMobileTest

class MockFetchCategoryListService: FetchCategoryListService {
    
    func fetchCategoryList(completion: @escaping CompletionCategoryResponse) {
        
        let stubGenerator = StubGenerator()
        if let data = stubGenerator.getCategoriesData() {
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseModel = try jsonDecoder.decode([CategoryResponse].self, from: data)
                
                completion(.success(responseModel))
                
            } catch let error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
