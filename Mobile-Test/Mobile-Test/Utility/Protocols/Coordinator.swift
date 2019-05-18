//
//  Coordinator.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import UIKit

public protocol Coordinator : class {
    
    var childCoordinators: [Coordinator] { get set }
    
    // All coordinators will be initilised with a navigation controller
    init(navigationController: UINavigationController)
    
    func start()
}
