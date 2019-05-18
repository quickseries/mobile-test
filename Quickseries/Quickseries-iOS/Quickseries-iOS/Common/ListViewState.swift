//
//  ListViewState.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

enum ListViewState {
    case error(errorMessage: String)
    case loading
    case displayingData
}
