//
//  DataManager.swift
//  Jet
//
//  Created by Tester on 8/6/18.
//  Copyright © 2018 Jet Inc. All rights reserved.
//

import RealmSwift

class DataStorageLayer: NSObject {
    
    class func saveCategoriesList(arrCategories:NSArray)
    {
        let realm = try? Realm()
        
        for item in arrCategories
        {
            guard let categorObj = item as?  [String:Any]
            else { return }
            
            if let realmCategoryModel = Categories(JSON: categorObj)
            {
                try? realm?.write {
                    realm?.add(realmCategoryModel,update: true)
                }
            }
        }
    }
    class func saveResourcesList(arrResources:NSArray)
    {
        let realm = try? Realm()
        
        for item in arrResources
        {
            guard let resourceObj = item as?  [String:Any]
                else { return }
            
            if let realmResourceModel = Resources(JSON: resourceObj)
            {
                try? realm?.write {
                    realm?.add(realmResourceModel,update: true)
                }
            }
        }
    }

}
