//
//  String+Ext.swift
//  QuickSeries
//
//  Created by Parth Patel on 15/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation
import UIKit

struct Font {
    static let titleFont = UIFont.systemFont(ofSize: 14)
    static let subTitleFont = UIFont.systemFont(ofSize: 17)
}

extension String {

    private var convertHtmlToNSAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data,options: [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    public func convertHtmlToAttributedStringWithCSS(font: UIFont? , cssColor: String , lineHeight: Int, cssTextAlign: String) -> NSAttributedString? {
        guard let font = font else {
            return convertHtmlToNSAttributedString
        }
        let modifiedString = "<style>body{font-family: '\(font.fontName)'; font-size:\(font.pointSize)px; color: \(cssColor); line-height: \(lineHeight)px; text-align: \(cssTextAlign); }</style>\(self)";
        guard let data = modifiedString.data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error)
            return nil
        }
    }
}

