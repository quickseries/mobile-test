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
    var categories = Array<Categories>()
    var onCompletion:((_ results: [Categories]) -> Void)?
    
    func fetchCategories(id:String, completionHandler: @escaping ([Categories]) -> Void){
        let messagesFromDisk = Storage.retrieve("categories", of: .json, as: [Categories].self)
        print(messagesFromDisk)
        onCompletion = completionHandler
        categories = messagesFromDisk
        if let selectionComplete = onCompletion {
            selectionComplete(categories)
        }
    }
}

