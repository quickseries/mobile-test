//
//  FetchResourceListRepository.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

protocol FetchResourceListRepository {
    func fetchResourceList(for type: CategoryType, completion: @escaping CompletionResourceResponse)
}

class FetchResourceListRepositoryImpl: FetchResourceListRepository {
    
    private let service: FetchResourceListService
    
    init(service: FetchResourceListService) {
        self.service = service
    }
    
    func fetchResourceList(for type: CategoryType, completion: @escaping CompletionResourceResponse) {
        service.fetchResourceList(for: type, completion: completion)
    }
}
