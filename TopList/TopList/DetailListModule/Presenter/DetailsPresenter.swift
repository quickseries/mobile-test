//---------------------------------------------------------------------------------------------------------------------------------------
//  File Name        :   CategoriesPresenter
//  Description      :   Presenter to manange the categories from data store
//                   :   1. UI    - https://github.com/ratzr15/mobile-test/blob/master/resources_android.png
//                       2. Architecture    - TDD + Clean Swift (http://clean-swift.com)
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  18th May 2019
//  Copyright (c) 2019-20 Rathish Kannan. All rights reserved.
//----------------------------------------------------------------------------------------------------------------------------------------

import UIKit

protocol DetailsPresentationLogic{
    func presentDetails(response: Details.FetchDetails.Response)
}

class DetailsPresenter: DetailsPresentationLogic{
    weak var viewController: DetailsDisplayLogic?
    
    // MARK: Present to View
    
    func presentDetails(response: Details.FetchDetails.Response){
        var details: [Details.FetchDetails.ViewModel.DetailsItem] = []
        
        for detail in response.details {
            let listVM = Details.FetchDetails.ViewModel.DetailsItem.init(name: detail.title ?? "", pictureUrl: detail.photo ?? "", overView: detail.description ?? "" , date: detail.created_at ?? "")
                details.append(listVM)
        }
        
        let viewModel = Details.FetchDetails.ViewModel(details: details)
        viewController?.displayDetails(viewModel: viewModel)

    }
}
