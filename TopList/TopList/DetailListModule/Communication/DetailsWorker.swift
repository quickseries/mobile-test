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

class DetailsWorker{
    var details = Array<DetailLists>()
    var onCompletion:((_ results: [DetailLists]) -> Void)?
    
    func fetchDetails(id:String, completionHandler: @escaping ([DetailLists]) -> Void){
        let resources = Storage.retrieve(id, of: .json, as: [DetailLists].self)
        onCompletion = completionHandler
        details = resources
        if let selectionComplete = onCompletion {
            selectionComplete(details)
        }
    }
}

