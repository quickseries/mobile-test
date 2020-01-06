//  String+Extension.swift
//  QuickSeries
//
//  Created by Franck Clement on 05/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import Foundation

extension String {
    
    /// Remove every html tags contained in Self and returns the corresponding String
    public func htmlFree() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
