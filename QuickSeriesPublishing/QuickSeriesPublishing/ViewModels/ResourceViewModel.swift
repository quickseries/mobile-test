//
//  ResourceViewModel.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

class ResourceViewModel: NSObject {
    private var interactor: ResourceInteracting
    private var categoryId: String
    private var resources = [Resource]()
    private var isAscending = true
    
    init(categoryId: String, interactor: ResourceInteracting) {
        self.categoryId = categoryId
        self.interactor = interactor
    }
}

extension ResourceViewModel {
    func fetch (_ completion: @escaping (([Resource]) -> ())) {
        interactor.fetchResource(categoryId) { [weak self ] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let res):
                strongSelf.resources = res.sorted(by: { (res1, res2) -> Bool in
                    if let s1 = res1.slug, let s2 = res2.slug {
                        return s1 < s2
                    }
                    
                    return false
                })
                completion(strongSelf.resources)
            case .error(let error):
                print("error is \(error.localizedDescription)")
            }
        }
    }
    
    func sort(_ completion: @escaping (([Resource]) -> ())) {
        isAscending = !isAscending
        
        resources = resources.sorted(by: {(res1, res2) -> Bool in
            if let s1 = res1.slug, let s2 = res2.slug {
                if isAscending {
                    return s1 < s2
                } else {
                    return s1 > s2
                }
                                
            }
            
            return false
        })
        
        
        completion(resources)
    }
}
