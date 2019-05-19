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

enum ListViewModelItemType {
    case list
    case details
    case noResult
}

protocol ListViewModelItem {
    var type: ListViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

struct NoResultsItem: ListViewModelItem {
    var type: ListViewModelItemType {
        return .noResult
    }
    
    var sectionTitle: String {
        return self.name
    }
    
    var rowCount: Int {
        return 0
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}



enum Category{
    // MARK: Use cases    
    enum FetchCategories{
        struct Request{
            var id:String
        }
        
        struct Response{
            var categories: [Categories]
        }
        
        struct ViewModel {
            struct ListItem: ListViewModelItem {
                var type: ListViewModelItemType {
                    return .list
                }
                
                var sectionTitle: String {
                    return self.date
                }
                
                var rowCount: Int {
                    return 1
                }
                
                var headLine: String
                var overView: String
                var date: String
                
                init(headLine: String, overView: String, date: String) {
                    self.headLine = headLine
                    self.overView = overView
                    self.date = date
                }
            }
            var categories: [ListItem]
        }

    }
}

