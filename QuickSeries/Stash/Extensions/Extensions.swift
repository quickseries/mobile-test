//
//  Extensions.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/27/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit

extension String{
    
    func getFormattedString() -> NSAttributedString? {
        
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        guard let string = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        let myNSRange = NSRange(location: 0, length: string.string.count)
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "AvenirNext-Regular", size: 13)!]
        string.addAttributes(myAttribute, range: myNSRange)
        
        return string
        
    }
}
