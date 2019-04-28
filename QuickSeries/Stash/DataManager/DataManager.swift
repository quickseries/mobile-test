//
//  DataManager.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/26/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift

class DataManager: NSObject {

    class func storeCategoriesList(arrCategories:NSArray)
    {
        DataStorageLayer.saveCategoriesList(arrCategories: arrCategories)
    }
    class func storeResources(arrResources:NSArray)
    {
        DataStorageLayer.saveResourcesList(arrResources: arrResources)
    }

    class func getCategories(filter:String) -> Results<Categories>
    {
        return DataFetchLayer.getCategories(filter: filter)
    }
    class func validateAndStore(filepath:String,fileExtension:String) -> Bool
    {
        let dataResource = Utils.getDataForJson(filePath: filepath, extensionName: fileExtension)
        
        if dataResource.success
        {
            DataManager.storeResources(arrResources: dataResource.dataArray)
            return true
        }
        
        return false
    }
}
