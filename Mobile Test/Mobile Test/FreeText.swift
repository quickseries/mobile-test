//
//  FreeText.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import Foundation

enum FreeTextFields:String{
    case freeText = "freeText"
}

class FreeText: NSObject {
    var freeText:String?

    
    required init(json: [String:Any]) {
        self.freeText = json[FreeTextFields.freeText.rawValue] as? String
    }
}
