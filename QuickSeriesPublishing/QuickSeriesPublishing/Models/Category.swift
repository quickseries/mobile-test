//
//  Category.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

struct Category: Codable {
//    var id: String
//    var slug: String
//    var customID: String
//    var eid: String
//    var title: String
//    var description: String
//    var version: Int
//    var active: Bool
//    var createAt: String
    
    var _id: String? = nil
    var updated_at: String? = nil
    var slug: String? = nil
    var custom_module_eid: String? = nil
    var eid: String? = nil
    var title: String? = nil
    var description: String? = nil
    var __v: Int = 0
    var _active: Bool = false
    var created_at: String? = nil
}
