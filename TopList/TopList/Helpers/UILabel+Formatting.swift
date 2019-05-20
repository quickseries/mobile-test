//
//  UILabelHTML.swift
//  SSSApp
//
//  Created by Rathish on 8/10/17.
//  Copyright © 2017 ExampleCompany. All rights reserved.
//

import Foundation

extension UILabel {
    func from(html: String, font: UIFont, color: UIColor? = SSSColors.Brands.DarkGrey) {
        let paragraphStyle = NSMutableParagraphStyle.init()
        if isArabicMode{
            paragraphStyle.alignment = .right

        }
        let oldPriceAttributes = [
            NSForegroundColorAttributeName: SSSColors.Brands.DarkGrey,
            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
            NSParagraphStyleAttributeName: paragraphStyle,
            NSFontAttributeName: font
        ] as [String : Any]

        if let htmlData = html.data(using: String.Encoding.unicode) {
            do {
                let matt = NSMutableAttributedString(attributedString:try NSMutableAttributedString(data: htmlData,
                                                                                                    options: oldPriceAttributes,
                                                                                                    documentAttributes: nil))               
                matt.enumerateAttribute(
                    NSFontAttributeName,
                    in:NSMakeRange(0,matt.length),
                    options:.longestEffectiveRangeNotRequired) { value, range, stop in
                        let f1 = value as! UIFont
                        let f2 = font
                        if let f3 = applyTraitsFromFont(f1, to:f2) {
                            matt.addAttribute(NSFontAttributeName, value:f3, range:range)
                            matt.addAttribute(NSFontAttributeName, value:font, range:range)
                            matt.addAttribute(NSForegroundColorAttributeName, value: color , range: range)
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

    
    func addIconToLabel(imageName: String, labelText: String, bounds_x: Double, bounds_y: Double, boundsWidth: Double, boundsHeight: Double) {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)
        attachment.bounds = CGRect(x: bounds_x, y: bounds_y, width: boundsWidth, height: boundsHeight)
        let attachmentStr = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: "")
        string.append(attachmentStr)
        let string2 = NSMutableAttributedString(string: labelText)
        string.append(string2)
        self.attributedText = string
    }
    
    func decideTextDirection () {
        let tagScheme = [NSLinguisticTagSchemeLanguage]
        let tagger    = NSLinguisticTagger(tagSchemes: tagScheme, options: 0)
        tagger.string = self.text
        let lang      = tagger.tag(at: 0, scheme: NSLinguisticTagSchemeLanguage,
                                   tokenRange: nil, sentenceRange: nil)
        
        if lang?.range(of:"ar") != nil {
            self.textAlignment = NSTextAlignment.right
        } else {
            self.textAlignment = NSTextAlignment.left
        }
    }

    func textHeight(for width: CGFloat) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.height(for: width, font: font)
    }
    
    func halfColorChangeForText(fullText: String, changeColortext:String, color:UIColor) {
        let strNumber : NSString = fullText as NSString
        let range = (strNumber).range(of: changeColortext)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSForegroundColorAttributeName, value: color , range: range)
        self.attributedText = attribute
    }
    
    func underline(fullText: String, underLineText:String, color:UIColor) {
        let strText : NSString = fullText as NSString
        let range = (strText).range(of: underLineText)
        let attribute = NSMutableAttributedString(string: fullText, attributes: [
            NSFontAttributeName: UIFont.subTitle()
            ])
        attribute.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: range)
        attribute.addAttribute(NSForegroundColorAttributeName, value: color , range: range)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.5
        attribute.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range: range)
        self.attributedText = attribute
    }
    
    func formatUnderline(html: String, font: UIFont, underLineText:String,underLineColor:UIColor, color:UIColor, underlineFont:UIFont = UIFont.subTitle()) {
        let paragraphStyle = NSMutableParagraphStyle.init()
        if isArabicMode{
            paragraphStyle.alignment = .right
        }
        guard let r1 = (html).range(of: underLineText) else {
            return
        }
        let rangeUnderline = NSRange(r1 , in: html)
        let oldPriceAttributes = [
            NSForegroundColorAttributeName: SSSColors.Brands.DarkGrey,NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSParagraphStyleAttributeName: paragraphStyle,NSFontAttributeName: font] as [String : Any]
        if let htmlData = html.data(using: String.Encoding.unicode) {
            do {
                let matt = NSMutableAttributedString(attributedString:try NSMutableAttributedString(data: htmlData,options: oldPriceAttributes,documentAttributes: nil))
                matt.enumerateAttribute(
                    NSFontAttributeName,
                    in:NSMakeRange(0,matt.length),
                    options:.longestEffectiveRangeNotRequired) { value, range, stop in
                        let f1 = value as! UIFont
                        let f2 = font
                        if let f3 = applyTraitsFromFont(f1, to:f2) {
                            //FIXME : Crash on iOS 10
                            matt.addAttribute(NSFontAttributeName, value:f3, range:range)
                            matt.addAttribute(NSForegroundColorAttributeName, value: color , range: range)
                            matt.addAttribute(NSFontAttributeName, value:font, range:range)
                            
                            matt.addAttribute(NSFontAttributeName, value:underlineFont, range:rangeUnderline)
                            matt.addAttribute(NSUnderlineStyleAttributeName , value: NSUnderlineStyle.styleSingle.rawValue, range: rangeUnderline)
                            matt.addAttribute(NSForegroundColorAttributeName, value: underLineColor , range: rangeUnderline)
                        }
                }
                self.attributedText = matt
            } catch let e as NSError {
                print("Couldn't parse \(html): \(e.localizedDescription)")
            }
        }
    }
}

