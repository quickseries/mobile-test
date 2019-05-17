//
//  String+htmlToAttributedString.swift
//  mobileTest
//
//  Created by Balraj Singh on 17/05/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import UIKit
import Foundation

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
}
