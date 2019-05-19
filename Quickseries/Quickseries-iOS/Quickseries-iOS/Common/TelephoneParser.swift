//
//  TelephoneParser.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import PhoneNumberKit

final class TelephoneParser {
    
    private let phoneKit = PhoneNumberKit()
    
    static let shared = TelephoneParser()
    
    func parse(number: String?) -> String? {
        if let number = number, let phoneNumber = try? phoneKit.parse(number, withRegion: "US", ignoreType: true) {
            return phoneKit.format(phoneNumber, toType: .national)
        } else {
            return number
        }
    }
}
