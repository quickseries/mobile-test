//---------------------------------------------------------------------------------------------------------------------------------------
//  File Name        :   CategoriesInteractor
//  Description      :   Median to request & recieve the data to UI
//                   :   1. UI    - https://github.com/ratzr15/mobile-test/blob/master/resources_android.png
//                       2. Architecture    - TDD + Clean Swift (http://clean-swift.com)
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  18th May 2019
//  Copyright (c) 2019-20 Rathish Kannan. All rights reserved.
//----------------------------------------------------------------------------------------------------------------------------------------

import UIKit

protocol FetchCategoriesBusinessLogic{
    func fetchCategories(request: Category.FetchCategories.Request)
}

protocol CategoryDataStore{
    var categories: [Categories]? { get }
}

class CategoriesInteractor: FetchCategoriesBusinessLogic, CategoryDataStore{
    var categories: [Categories]?
    var presenter: CategoriesPresentationLogic?
    var worker: CategoriesWorker?
    
    func fetchCategories(request: Category.FetchCategories.Request) {
        worker = CategoriesWorker()
        worker?.fetchCategories(id: request.id){ (categories) -> Void in
            self.categories = categories 
            let response = Category.FetchCategories.Response(categories: categories)
            self.presenter?.presentCategories(response: response)
        }
    }
}
