//
//  NamedColors.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

enum NamedColor {
  case darkText

  case custom(hexString: String, alpha: Double)
  
  func withAlpha(_ alpha: Double) -> UIColor {
    return self.value.withAlphaComponent(CGFloat(alpha))
  }
}
extension NamedColor {
  
  var value: UIColor {
    var instanceColor = UIColor.clear
    
    switch self {
    case .darkText:
      instanceColor = UIColor(hexString: "#ffffff")
    case .custom(let hexValue, let opacity):
      instanceColor = UIColor(hexString: hexValue).withAlphaComponent(CGFloat(opacity))
    }
    return instanceColor
  }
}
