//
//  String+HTML.swift
//  QSMobileTest
//
//  Created by Luis Alfonso Marquez Lecona on 2020-08-12.
//  Copyright © 2020 Quick Series. All rights reserved.
//

import Foundation

extension Data {
    var htmlToAttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var htmlToString: String { htmlToAttributedString?.string ?? "" }
}

extension StringProtocol {
 var htmlToAttributedString: NSAttributedString? {
     Data(utf8).htmlToAttributedString
 }
 var htmlToString: String {
     htmlToAttributedString?.string ?? ""
    }
}
