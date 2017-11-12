//
//  ResourceStore.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

class ResourceStore {
    
    func getListOfResources(category: String, completion:([Resource]?) -> Void) {
        
        var fileName = ""
        
        switch category {
        case CategoryType.restaurants.rawValue:
            fileName = "restaurants"
        case CategoryType.vacation_spots.rawValue:
            fileName = "vacation-spot"
        default:
            break
        }
        
        if let filepath = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)

                guard let result = Mapper<Resource>().mapArray(JSONString: contents)
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
