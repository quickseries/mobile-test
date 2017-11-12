//
//  ResourcesViewModel.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ResourceVMProtocol {
    
    var isFetchSuccessful: Dynamic<Bool> { get }
    var resources: [Resource] { get }
    var category: Category? { get }
    
    func getResourceList(forCategory: String?)
}

class ResourcesViewModel: ResourceVMProtocol {
 
    var category: Category?
    var isFetchSuccessful: Dynamic<Bool>
    var resources = [Resource]()
    
    init(category: Category) {
        self.category = category
        self.isFetchSuccessful = Dynamic(false)
    }
    
    
    func getResourceList(forCategory: String?) {
        
        guard let cat = forCategory else { return }
        
        switch cat {
        case CategoryType.restaurants.rawValue:
            getRestaurants()
        case CategoryType.vacation_spots.rawValue:
            getVacationSpots()
        default:
            break
        }
    }
    
    func getRestaurants() {
        if let filepath = Bundle.main.path(forResource: "restaurants", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
                // Convert JSON String to Model
                guard let result = Mapper<Resource>().mapArray(JSONString: contents) else { self.isFetchSuccessful.value = false
                    return }
                
                self.resources = result
                self.isFetchSuccessful.value = true
                
            } catch {
                print("file cannot be loaded")
            }
        } else {
            print("json file do not exist")
        }
    }
    
    
    func getVacationSpots() {
        if let filepath = Bundle.main.path(forResource: "vacation-spot", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                print(contents)
                // Convert JSON String to Model
                guard let result = Mapper<Resource>().mapArray(JSONString: contents) else { self.isFetchSuccessful.value = false
                    return }
                
                self.resources = result
                self.isFetchSuccessful.value = true
                
            } catch {
                print("file cannot be loaded")
            }
        } else {
            print("json file do not exist")
        }
    }
}
