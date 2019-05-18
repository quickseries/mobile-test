//
//  FetchResourceListUseCase.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

typealias CompletionResourceList = (APIResult<[ResourceItem]>) -> Void

protocol FetchResourceListUseCase {
    func fetchResourceList(for type: CategoryType, completion: @escaping CompletionResourceList)
}

class FetchResourceListUseCaseImpl: FetchResourceListUseCase {
    
    private let repository: FetchResourceListRepository
    
    init(repository: FetchResourceListRepository) {
        self.repository = repository
    }
    
    func fetchResourceList(for type: CategoryType, completion: @escaping CompletionResourceList) {
        repository.fetchResourceList(for: type) { result in
            switch result {
            case .success(let resources):
                let items = ResourceListApiToUIMapper.convert(from: resources)
                completion(.success(items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
