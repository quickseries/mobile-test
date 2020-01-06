//  NetStatus.swift
//  QuickSeries
//
//  Created by Franck Clement on 04/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import Foundation

/// Simple three state based Networking status
enum NetStatus {
    case loading
    case finished
    case failure(error: Error)
}
