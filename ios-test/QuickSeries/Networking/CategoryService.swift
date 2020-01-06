//  CategoryService.swift
//  QuickSeries
//
//  Created by Franck Clement on 04/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import Foundation

struct CategoryService: NetService {
    
    typealias Item = [Category]
    
    var session: URLSession = .shared
    var url: URL = URL(string: "https://raw.githubusercontent.com/franckclement/mobile-test/ios-test-franck-clement/data/categories.json")!
}
