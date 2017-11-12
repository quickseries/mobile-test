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
        
        if let filepath = Bundle.main.path(forResource: "categories", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
                // Convert JSON String to Model
                guard let result = Mapper<Category>().mapArray(JSONString: contents) else { self.isFetchSuccessful.value = false
                        return }
                
                self.categories = result
                self.isFetchSuccessful.value = true
                
            } catch {
                print("file cannot be loaded")
            }
        } else {
            print("json file do not exist")
        }
    }
}
