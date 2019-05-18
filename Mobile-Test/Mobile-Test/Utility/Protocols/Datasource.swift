//
//  Datasource.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

protocol Datasource {
    associatedtype T
    
    func load() -> [T]
}
