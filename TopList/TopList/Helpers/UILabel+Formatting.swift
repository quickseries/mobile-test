//
//  UILabelHTML.swift
//
//  Created by Rathish on 8/10/17.
//  Copyright © 2017 ExampleCompany. All rights reserved.

import Foundation
import UIKit

extension UILabel {
    func formattedText(html: String, font: UIFont, color: UIColor? = .black) {
        let paragraphStyle = NSMutableParagraphStyle.init()
        let oldPriceAttributes = [
            NSAttributedString.Key.foregroundColor: colorFromHex(hexString: "#4a4a4a"),
            NSAttributedString.DocumentAttributeKey.documentType: NSAttributedString.DocumentType.html,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: font
            ] as! [NSAttributedString.DocumentReadingOptionKey : Any]

        if let htmlData = html.data(using: String.Encoding.unicode) {
            do {
                let matt = NSMutableAttributedString(attributedString:try NSMutableAttributedString(data: htmlData,
                                                                                                    options: oldPriceAttributes,
                                                                                                    documentAttributes: nil))               
                matt.enumerateAttribute(
                    NSAttributedString.Key.font,
                    in:NSMakeRange(0,matt.length),
                    options:.longestEffectiveRangeNotRequired) { value, range, stop in
                        let f1 = value as! UIFont
                        let f2 = font
                        if let f3 = applyTraitsFromFont(f1, to:f2) {
                            matt.addAttribute(NSAttributedString.Key.font, value:f3, range:range)
                            matt.addAttribute(NSAttributedString.Key.font, value:font, range:range)
                            matt.addAttribute(NSAttributedString.Key.foregroundColor, value: color ?? .black , range: range)
                        }
                }
                self.attributedText = matt
            } catch let e as NSError {
                print("Couldn't parse \(html): \(e.localizedDescription)")
            }
        }
    }
    
    
    func applyTraitsFromFont(_ f1: UIFont, to f2: UIFont) -> UIFont? {
        let t = f1.fontDescriptor.symbolicTraits
        if let fd = f2.fontDescriptor.withSymbolicTraits(t) {
            return UIFont.init(descriptor: fd, size: 0)
        }
        return nil
    }

    func colorFromHex(hexString:String) -> UIColor{
        var rgb: UInt32                         = 0
        let scanner                             = Scanner(string: hexString)
        scanner.scanLocation                    = 1;
        scanner.scanHexInt32(&rgb)
        return UIColor(red: CGFloat((rgb & 0xFF0000) >> 16)/255.0, green: CGFloat((rgb &   0xFF00) >>  8)/255.0, blue: CGFloat((rgb &     0xFF)      )/255.0, alpha: 1.0)
        
    }
    
}

