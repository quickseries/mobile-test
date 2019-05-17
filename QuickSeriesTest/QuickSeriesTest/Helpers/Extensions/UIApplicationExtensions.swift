//
//  UIApplicationExtensions.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit

extension UIApplication {
  
  static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
    
    if let nav = base as? UINavigationController {
      return topViewController(base: nav.visibleViewController)
    }
    
    if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
      return topViewController(base: selected)
    }
    
    if let presented = base?.presentedViewController {
      return topViewController(base: presented)
    }
    
    return base
  }
}
