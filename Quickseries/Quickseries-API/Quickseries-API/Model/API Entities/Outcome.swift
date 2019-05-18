//
//  Outcome.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public enum Outcome<E> {
    case success(result: E)
    case failure(error: Error, reason: String)
}
