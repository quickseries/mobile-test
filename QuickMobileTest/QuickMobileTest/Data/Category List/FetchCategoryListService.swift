//
//  FetchCategoryListService.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

typealias CompletionCategoryResponse = (APIResult<[CategoryResponse]>) -> Void


protocol FetchCategoryListService {
    func fetchCategoryList(completion: @escaping CompletionCategoryResponse)
}

class FetchCategoryListServiceImpl: BaseService, FetchCategoryListService {
    
    func fetchCategoryList(completion: @escaping CompletionCategoryResponse) {
        
        guard let url = URL(string: ApiUrlConstants.CategoryList.url) else {
            completion(.failure(NSError(domain: "com.quickseries.categotylist", code: 45454, userInfo: nil) as Error))
            return
        }
        
        self.loadData(type: [CategoryResponse].self,
                      url: url,
                      method: .get,
                      parameters: nil) { response, error, data in
                        
                        guard let response = response, error == nil else {
                            completion(.failure(error!))
                            return
                        }
                        completion(.success(response))
        }
    }
    
}
