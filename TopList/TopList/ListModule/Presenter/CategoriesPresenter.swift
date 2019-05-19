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

protocol CategoriesPresentationLogic{
    func presentCategories(response: Category.FetchCategories.Response)
}

class CategoriesPresenter: CategoriesPresentationLogic{
    weak var viewController: CategoriesDisplayLogic?
    
    // MARK: Present to View

    func presentCategories(response: Category.FetchCategories.Response){
        var displayedCategories: [Category.FetchCategories.ViewModel.ListItem] = []
        
        for category in response.categories {
                let listVM = Category.FetchCategories.ViewModel.ListItem.init(headLine: category.title ?? "", overView: category.description ?? "" , id: category.slug ?? "")
                displayedCategories.append(listVM)
        }
        
        let viewModel = Category.FetchCategories.ViewModel(categories: displayedCategories)
        viewController?.displayFetchedCategories(viewModel: viewModel)

    }
}
