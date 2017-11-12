//
//  Dynamic.swift
//  MovieDBExample
//
//  Created by Patel, Tarang on 2/1/17.
//  Copyright © 2017 Patel, Tarang. All rights reserved.
//

import Foundation


class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
