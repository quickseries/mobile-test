//
//  FetchCategoryListUseCase.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

typealias CompletionCategoryList = (APIResult<[CategoryItem]>) -> Void

protocol FetchCategoryListUseCase {
    func fetchCategoryList(completion: @escaping CompletionCategoryList)
}

class FetchCategoryListUseCaseImpl: FetchCategoryListUseCase {
    
    private let repository: FetchCategoryListRepository
    
    init(repository: FetchCategoryListRepository) {
        self.repository = repository
    }
    
    func fetchCategoryList(completion: @escaping CompletionCategoryList) {
        repository.fetchCategoryList { (result) in
            switch result {
            case .success(let categories):
                let items = CategoryListApiToUIMapper.convert(from: categories)
                completion(.success(items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
