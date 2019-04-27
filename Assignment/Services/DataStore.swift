//
//  DataStore.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation

public class DataStore{
    public static let shared = DataStore()
    private init() {}
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        //        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =
        "yyyy-MM-dd'T'HH:mm:ss.zzzZ"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    
    public func fetchCategories(fromFile fileName: String, successHandler: @escaping (_ response: [CategoryModel]) -> Void, errorHandler: @escaping(_ error: Error) -> Void) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")
            else {
              return
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            let categoryModelsArray = try self.jsonDecoder.decode([CategoryModel].self, from: jsonData)
    
            DataManager.sharedInstance.updateCategoriesModels(pCategories: categoryModelsArray, successHandler: { (isSaveSuccess) in
                if isSaveSuccess{
                    DispatchQueue.main.async {
                        successHandler(categoryModelsArray)
                    }
                }
            }) { (error) in
                self.handleError(errorHandler: errorHandler, error: error)
            }
        } catch {
            self.handleError(errorHandler: errorHandler, error: error)
        }
       
        
    }
    
    
    public func fetchSpots(fromFile fileName: String, successHandler: @escaping (_ response: [SpotModel]) -> Void, errorHandler: @escaping(_ error: Error) -> Void) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")
            else {
                return
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            let spotModelsArray = try self.jsonDecoder.decode([SpotModel].self, from: jsonData)
            
            DataManager.sharedInstance.updateSpotsModels(pSpots: spotModelsArray, successHandler: { (isSaveSuccess) in
                if isSaveSuccess{
                    DispatchQueue.main.async {
                        successHandler(spotModelsArray)
                    }
                }
            }) { (error) in
                self.handleError(errorHandler: errorHandler, error: error)
            }
        } catch {
            self.handleError(errorHandler: errorHandler, error: error)
        }
    }
    
    public func fetchRestaurants(fromFile fileName: String, successHandler: @escaping (_ response: [SpotModel]) -> Void, errorHandler: @escaping(_ error: Error) -> Void) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")
            else {
                return
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            
            let restaurantModelsArray = try self.jsonDecoder.decode([SpotModel].self, from: jsonData)
            DispatchQueue.main.async {
                successHandler(restaurantModelsArray)
            }
        } catch {
            self.handleError(errorHandler: errorHandler, error: error)
        }
        
    }
    
    
    private func handleError(errorHandler: @escaping(_ error: Error) -> Void, error: Error) {
        DispatchQueue.main.async {
            errorHandler(error)
        }
    }
    
}

