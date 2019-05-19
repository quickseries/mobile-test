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

enum Details{
    // MARK: Use cases    
    enum FetchDetails{
        struct Request{
            var id:String
        }
        
        struct Response{
            var details: [DetailLists]
        }
        
        struct ViewModel {
            struct DetailsItem: ListViewModelItem {
                var type: ListViewModelItemType {
                    return .details
                }
                
                var sectionTitle: String {
                    return self.date
                }
                
                var rowCount: Int {
                    return 1
                }
                
                var name: String
                var pictureUrl: String
                var overView: String
                var date: String
                
                init(name: String, pictureUrl: String, overView: String, date: String) {
                    self.name = name
                    self.pictureUrl = pictureUrl
                    self.overView = overView
                    self.date = date
                }
            }
            var details: [DetailsItem]
        }

    }
}
