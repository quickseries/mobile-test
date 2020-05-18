//
//  UIView+Ext.swift
//  QuickSeries
//
//  Created by Parth Patel on 16/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit
import Foundation


@IBDesignable
extension UIView {
    
    @IBInspectable
    public var circleCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = circleCorner ? min(bounds.size.height, bounds.size.width) / 2 : newValue
        }
    }
}


