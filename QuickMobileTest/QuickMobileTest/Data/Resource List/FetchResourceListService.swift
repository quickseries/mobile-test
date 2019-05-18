//
//  FetchResourceListService.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

typealias CompletionResourceResponse = (APIResult<[ResourceResponse]>) -> Void


protocol FetchResourceListService {
    func fetchResourceList(for type: CategoryType, completion: @escaping CompletionResourceResponse)
}

class FetchResourceListServiceImpl: BaseService, FetchResourceListService {
    
    func fetchResourceList(for type: CategoryType, completion: @escaping CompletionResourceResponse) {
        
        guard let url = URL(string: ApiUrlConstants.ResourceList.url(for: type)) else {
            completion(.failure(NSError(domain: "com.quickseries.categotylist", code: 45454, userInfo: nil) as Error))
            return
        }
        
        self.loadData(type: [ResourceResponse].self,
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
