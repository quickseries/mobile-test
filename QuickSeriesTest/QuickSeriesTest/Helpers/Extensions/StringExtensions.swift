//
//  StringExtensions.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

extension String {
  func htmlAttributed(family: String?, size: CGFloat) -> NSAttributedString? {
    do {
      let htmlCSSString = "<style>" +
        "html *" +
        "{" +
        "font-size: \(size)pt !important;" +
        "direction: rtl!important;" +
        "" +
        "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
      "}</style> \(self)"
      
      guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
        return nil
      }
      
      return try NSAttributedString(data: data,
                                    options: [.documentType: NSAttributedString.DocumentType.html,
                                              .characterEncoding: String.Encoding.utf8.rawValue],
                                    documentAttributes: nil)
    } catch {
      print("error: ", error)
      return nil
    }
  }
}
