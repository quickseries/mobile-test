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

protocol FetchDetailsBusinessLogic{
    func fetchDetails(request: Details.FetchDetails.Request)
}

protocol DetailDataStore{
    var details: [DetailLists]? { get }
}

class DetailsInteractor: FetchDetailsBusinessLogic, DetailDataStore{
    var details: [DetailLists]?
    var presenter: DetailsPresentationLogic?
    var worker: DetailsWorker?
    
    func fetchDetails(request: Details.FetchDetails.Request) {
        worker = DetailsWorker()
        worker?.fetchDetails(id: request.id){ (details) -> Void in
            self.details = details
            let response = Details.FetchDetails.Response(details: details)
            self.presenter?.presentDetails(response: response)
        }
    }
}
