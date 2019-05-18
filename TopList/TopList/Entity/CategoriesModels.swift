//---------------------------------------------------------------------------------------------------------------------------------------
//  File Name        :   CategoriesModels
//  Description      :   VM's resolved as Equatables
//                   :   1. UI    - https://github.com/ratzr15/mobile-test/blob/master/resources_android.png
//                       2. Architecture    - TDD + Clean Swift (http://clean-swift.com)
//  Author            :  Rathish Kannan
//  E-mail            :  rathishnk@hotmail.co.in
//  Dated             :  18th May 2019
//  Copyright (c) 2019-20 Rathish Kannan. All rights reserved.
//----------------------------------------------------------------------------------------------------------------------------------------

import UIKit

enum Category{
    // MARK: Use cases
    
    enum FetchCategories{
        struct Request{
            var id:String
        }
        
        struct Response{
            var categories: [Any]
        }
        
        struct ViewModel{
            //TODO: Make use of VM to convert from API to required format
            struct DisplayedCategories{
                var id: String
                var date: String
                var email: String
                var name: String
                var total: String
            }
            var displayedCategories: [Any] //FIXME: Displayed
        }
    }
}
