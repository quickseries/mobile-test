//
//  Resource.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public protocol Resource {
    var id: Int { get }
    var title: String { get }
}
