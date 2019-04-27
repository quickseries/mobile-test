//
//  CategoryModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/26/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
import RealmSwift



@objc public class CategoryModel: Object, Codable{
    @objc dynamic public var _id: String?           //"59839fd7951cf747207bed3e",
    @objc dynamic public var updated_at: String?          //"2017-08-03T22:12:39.544Z",
    @objc dynamic public var slug: String?              //"restaurants",
    @objc dynamic public var custom_module_eid: String? // "aad16857-166d-43d4-8f16-d097902838cf",
    @objc dynamic public var eid: String?               //"ac5bd194-11de-48f6-94db-fd16cfccb570",
    @objc dynamic public var title: String?             //"Restaurants",
    @objc dynamic public var description1: String?      //"Find local restaurants",
    dynamic public var __v: Int?                        //,
    dynamic public var _active: Bool?                   // true,
    @objc dynamic public var created_at: String?        // "2017-08-03T22:12:39.537Z"
    
    override public static func primaryKey() -> String? {
        return "_id"
    }
    enum CodingKeys: String, CodingKey {
        case _id
        case updated_at
        case slug
        case custom_module_eid
        case eid
        case title
        case description1 = "description"
        case __v
        case _active
        case created_at
    }
    
}



