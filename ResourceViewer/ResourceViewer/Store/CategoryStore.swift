//
//  CategoryStore.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoryStore {

    func getListOfCategories(completion:([Category]?) -> Void) {
        
        if let filepath = Bundle.main.path(forResource: "categories", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
                // Convert JSON String to Model
                guard let result = Mapper<Category>().mapArray(JSONString: contents)
                else { completion(nil)
                        return }
                
                completion(result)
            } catch {
                print("file cannot be loaded")
            }
        } else {
            print("json file do not exist")
        }
        
    }
    
}
