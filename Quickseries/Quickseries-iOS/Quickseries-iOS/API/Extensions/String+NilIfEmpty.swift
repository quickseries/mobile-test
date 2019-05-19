//
//  String+NilIfEmpty.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

extension String {
    var nilIfEmpty: String? {
        return self.isEmpty ? nil : self
    }
}

