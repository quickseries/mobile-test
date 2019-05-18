//---------------------------------------------------------------------------------------------------------------------------------------
//  File Name        :   CategoriesPresenter
//  Description      :   API/ store manager that resolves data
//                   :   1. UI    - https://github.com/ratzr15/mobile-test/blob/master/resources_android.png
//                       2. Architecture    - TDD + Clean Swift (http://clean-swift.com)
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  18th May 2019
//  Copyright (c) 2019-20 Rathish Kannan. All rights reserved.
//----------------------------------------------------------------------------------------------------------------------------------------

import UIKit

class CategoriesWorker{
    
    let kPageSize  = 8
    var categories = Array<Any>()
    
    var onCompletion:((_ results: [Any]) -> Void)?
    
    func fetchCategories(id:String, completionHandler: @escaping ([Any]) -> Void){
        let messagesFromDisk = Storage.retrieve("categories", of: .json, as: [Categories].self)
        
        print(messagesFromDisk)

    }
}

extension CategoriesWorker  {
    func successfullyFecthedCategories(data: Array<Any>, tag: NSInteger) {
        print(data)
        self.categories.append(contentsOf: data)
        
        if let selectionComplete = onCompletion {
            selectionComplete(self.categories)
        }
        print("✔️ Success")
        
    }
    
    func spineFailedCategoryFetch(_ error: String) {
        
        if let selectionComplete = onCompletion {
            selectionComplete([])
        }
        print("😡 Failure")
    }
    
}
