//
//  String+StripHTML.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

extension String {
    func stripHTML() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
