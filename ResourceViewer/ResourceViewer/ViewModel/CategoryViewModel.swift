//
//  CategoryViewModel.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit
import ObjectMapper

enum CategoryType: String {
    case restaurants = "restaurants"
    case vacation_spots = "vacation-spots"
}

protocol CategoryVMProtocol {
    
    var isFetchSuccessful: Dynamic<Bool> { get }
    func getCateoryList()
}

class CategoryViewModel: CategoryVMProtocol {

    var categories = [Category]()
    var isFetchSuccessful: Dynamic<Bool>
    
    init() {
        self.isFetchSuccessful = Dynamic(false)
    }
    
    func getCateoryList() {
        
        CategoryStore().getListOfCategories { (result) in
            
            if let r = result {
                self.categories = r
                self.isFetchSuccessful.value = true
            }
            else {
                self.isFetchSuccessful.value = false
            }
        }

    }
}
