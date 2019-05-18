//
//  GlobalVariables.swift
//  Mobile Test
//
//  Created by Alecu Truica on 5/18/19.
//  Copyright © 2019 Alecu Truica. All rights reserved.
//

import Foundation

class GlobalVariables {
    public var restaurantsEid: String = ""
    public var vacationSpotsEid: String = ""
    
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
