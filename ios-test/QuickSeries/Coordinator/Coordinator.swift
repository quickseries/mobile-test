//  Coordinator.swift
//  QuickSeries
//
//  Created by Franck Clement on 03/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

/// A Coordinator's role is to extract navigation from UIViewController.
/// To do so, you must initialize the coordinator's root UIViewController in the `start()` method.
protocol Coordinator: class {
    
    /// The Coordinator's childs
    /// - Note:
    /// A parent coordinator keep track of its childs, so they are not deallocated
    /// after a child is pushed
    var childCoordinators: [Coordinator] { get set }
    
    /// Start the Coordinator
    func start()
}

// MARK: Convenience methods

extension Coordinator {

    /// Add the given child Coordinator to the parent
    /// - Parameter child: the given child Coordinator
    func add(child: Coordinator) {
        childCoordinators.append(child)
    }
    
    /// Remove the given child Coordinator from the parent
    /// - Parameter child: the given child Coordinator
    func remove(child: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== child }
    }
}
