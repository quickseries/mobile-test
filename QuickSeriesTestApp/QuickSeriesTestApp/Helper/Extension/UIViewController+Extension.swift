//
//  UIViewController+Extension.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

extension UIViewController {
    var innerViewController: UIViewController {
        if let outterNavigationController = self as? UINavigationController {
            return outterNavigationController.visibleViewController ?? self
        } else {
            return self
        }
    }
}
