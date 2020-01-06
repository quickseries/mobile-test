//  UIViewController+Extension.swift
//  QuickSeries
//
//  Created by Franck Clement on 05/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

extension UIViewController {
    
    /// Inform users when an error occurred through information AlertController
    func handle(error: Error) {
        let errorAlert = UIAlertController(title: "An Error Occurred", message: error.localizedDescription, preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(errorAlert, animated: true, completion: nil)
    }
}
