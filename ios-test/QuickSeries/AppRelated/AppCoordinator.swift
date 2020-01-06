//  AppCoordinator.swift
//  QuickSeries
//
//  Created by Franck Clement on 03/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import UIKit

/// The AppCoordinator is a special Coordinator.
/// It is dedicated to the initialisation of every components in the app.
/// Here you can start background services, setup crash reporting tools
/// like Crashlytics or AppCenter as well as initializing the Persistence Layer of your app (Core Data, Realm, SQLite, ...)
final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []

    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let navigationController = UINavigationController()
        let categoriesCoordinator = CategoriesCoordinator(navigationController: navigationController)
        add(child: categoriesCoordinator)
        categoriesCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        setupCrashReporting()
    }
    
    private func setupCrashReporting() {
        // CrashLytics initialization ...
    }
}
