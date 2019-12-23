//
//  NetworkError.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case requestError
    case parseError
    case noDataFound
    case dateParseError
}
