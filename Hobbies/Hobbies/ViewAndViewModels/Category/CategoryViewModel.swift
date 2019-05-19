//
//  CategoryViewModel.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit
import RxSwift

class CategoryViewModel: NSObject
{
    public let categories : PublishSubject<[CategoryModel]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<AppError> = PublishSubject()

    func requestCategories()
    {
        let categoryService = CategoryServices()
        self.loading.onNext(true)
        categoryService.getAllCategories { (categories, error) in
            self.loading.onNext(false)
            guard error == nil else {
                MessageUtility.show(error: error!)
                return
            }
            self.categories.onNext(categories!)
        }
    }
}
