//
//  DataFetchLayer.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/26/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift

class DataFetchLayer: NSObject {

    class func getCategories(filter:String) -> Results<Categories>
    {
        let realmObj = try! Realm()
        let predicateStatus = NSPredicate.init(format: filter)
        let realmResults:Results<Categories> = realmObj.objects(Categories.self).filter(predicateStatus)
        
        return realmResults
    }

    class func getResources(filterItem:String,sorted:Bool) -> Results<Resources>
    {
        let realmObj = try! Realm()
        let predicateStatus = NSPredicate.init(format: "category_eid == %@",filterItem)
        let realmResults:Results<Resources> = realmObj.objects(Resources.self).filter(predicateStatus).sorted(byKeyPath: "title", ascending: sorted)
        
        return realmResults
    }

}
