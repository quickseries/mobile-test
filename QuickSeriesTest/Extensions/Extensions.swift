//
//  Extensions.swift
//  QuickSeriesTest
//
//  Created by Mathieu Massicotte on 2019-04-21.
//  Copyright © 2019 Via Logica Inc. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(withDictionary dict: Dictionary) {
        for (key, value) in dict {
            self.updateValue(value, forKey: key)
        }
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func formatPhoneNumber() -> String? {
        let phoneNumber = self
        var formattedNumber = phoneNumber
        if Int(phoneNumber) == nil || phoneNumber.count > 11 || phoneNumber.count < 7 {
            return nil
        }
        switch phoneNumber.count {
        case 11:
            formattedNumber = "\(phoneNumber[phoneNumber.startIndex])-"
            var startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 1)
            var endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 3)
            let areaCode = phoneNumber[startIndex...endIndex]
            formattedNumber.append("\(String(areaCode))-")
            startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 4)
            endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 6)
            let prefix = phoneNumber[startIndex...endIndex]
            formattedNumber.append("\(String(prefix))-")
            startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 7)
            endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 10)
            let suffix = phoneNumber[startIndex...endIndex]
            formattedNumber.append("\(String(suffix))")
            return formattedNumber
        case 10:
            formattedNumber = ""
            var startIndex = phoneNumber.startIndex
            var endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 2)
            let areaCode = phoneNumber[startIndex...endIndex]
            formattedNumber.append("\(String(areaCode))-")
            startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 3)
            endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 5)
            let prefix = phoneNumber[startIndex...endIndex]
            formattedNumber.append("\(String(prefix))-")
            startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 6)
            endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 9)
            let suffix = phoneNumber[startIndex...endIndex]
            formattedNumber.append("\(String(suffix))")
            return formattedNumber
        case 7:
            formattedNumber = ""
            var startIndex = phoneNumber.startIndex
            var endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 2)
            let areaCode = phoneNumber[startIndex...endIndex]
            formattedNumber.append("\(String(areaCode))-")
            startIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 3)
            endIndex = phoneNumber.index(phoneNumber.startIndex, offsetBy: 6)
            let prefix = phoneNumber[startIndex...endIndex]
            formattedNumber.append("\(String(prefix))-")
            return formattedNumber
        default:
            return formattedNumber
        }
    }
}
