//
//  Result.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

enum Result<T> {
    case success(T)
    case error(Error)
}

