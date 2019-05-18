//
//  FetchCategoryListRepository.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

protocol FetchCategoryListRepository {
    func fetchCategoryList(completion: @escaping CompletionCategoryResponse)
}

class FetchCategoryListRepositoryImpl: FetchCategoryListRepository {
    private let service: FetchCategoryListService
    
    init(service: FetchCategoryListService) {
        self.service = service
    }
    
    func fetchCategoryList(completion: @escaping CompletionCategoryResponse) {
        service.fetchCategoryList(completion: completion)
    }
}
