//
//  LocalDataManager.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/27/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//


import UIKit
import RealmSwift
class DataManager {
  
    private var   database:Realm
    static let   sharedInstance = DataManager()
    private init() {
        database = try! Realm()
    }
    
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    
    // MARK: - Categories
    func getCategoriesDataFromDB(successHandler: @escaping (_ results: Results<CategoryModel>) -> Void) ->  Void {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let results: Results<CategoryModel> =   self.database.objects(CategoryModel.self)
                successHandler(results)
            }
        }
    }
    
    func updateCategoriesModels(pCategories : [CategoryModel], successHandler: @escaping (_ isSuccess: Bool) -> Void, errorHandler: @escaping(_ error: Error) -> Void) -> Void {
        do {
            try database.write {
                database.add(pCategories, update: true)
                successHandler(true)
            }
        }
        catch {
            errorHandler(error)
        }
    }
    
    func addCategoryData(object: CategoryModel)   {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
    
    func deleteCategoryFromDb(object: CategoryModel)   {
        try!   database.write {
            database.delete(object)
        }
    }
    
    
  
}

extension DataManager {
    // MARK: - Spots
    func getSpotsDataFromDB(catEID:String, ascending:Bool, successHandler: @escaping (_ results: Results<SpotModel>) -> Void) ->  Void {
   
                var results: Results<SpotModel> =   self.database.objects(SpotModel.self).filter("category_eid = '\(catEID)'")
                results = results.sorted(byKeyPath: "title", ascending: ascending)
                 DispatchQueue.main.async {
                    successHandler(results)
        }
    }
    
    func updateSpotsModels(pSpots : [SpotModel], successHandler: @escaping (_ isSuccess: Bool) -> Void, errorHandler: @escaping(_ error: Error) -> Void) -> Void {
        do {
            try database.write {
                database.add(pSpots, update: true)
                successHandler(true)
            }
        }
        catch {
            errorHandler(error)
        }
    }
    
    func addSpotData(object: SpotModel)   {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
    
    func deleteSpotFromDb(object: SpotModel)   {
        try!   database.write {
            database.delete(object)
        }
    }
}


