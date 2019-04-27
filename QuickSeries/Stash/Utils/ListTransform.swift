//
//  ListTransform.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/26/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class ListTransform<T:RealmSwift.Object> : TransformType where T:Mappable {
    
    typealias Object = List<T>
    typealias JSON = [AnyObject]
    let mapper = Mapper<T>()
    func transformFromJSON(_ value: Any?) -> List<T>? {
        let results = List<T>()
        if let value = value as? [AnyObject] {
            for json in value {
                if let obj = mapper.map(JSONObject: json) {
                    results.append(obj)
                }
            }
        }
        return results
    }
    func transformToJSON(_ value: Object?) -> JSON? {
        var results = [AnyObject]()
        if let value = value {
            for obj in value {
                let json = mapper.toJSON(obj)
                results.append(json as AnyObject)
            }
        }
        return results
    }
}
