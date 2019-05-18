//
//  CategoryResponse.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation

struct CategoryResponse: Codable {
    let _id : String = ""
    let updated_at : String?
    let slug : String?
    let custom_module_eid : String?
    let eid : String?
    let title : String?
    let description : String = ""
    let __v : Int = 0
    let _active : Bool = false
    let created_at : String?
}
