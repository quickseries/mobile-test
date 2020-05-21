//
//  CategoryViewModel.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

class CategoryViewModel: NSObject {
    private var interactor: CategoryInteracting
    
    init(interactor: CategoryInteracting) {
        self.interactor = interactor
    }
}

extension CategoryViewModel {
    func fetch (_ completion: @escaping (([Category]) -> ())) {
        interactor.fetchCategories { result in
            switch result {
            case .success(let categories):
                completion(categories)
            case .error(let error):
                print("error is \(error.localizedDescription)")
            }
        }
    }
}
