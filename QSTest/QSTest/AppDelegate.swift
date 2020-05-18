//
//  AppDelegate.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-16.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appRouter: AppRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = BaseNavigationController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            window.rootViewController = navController
            window.makeKeyAndVisible()
        }
        
        appRouter = AppRouter(navController: navController)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return true
    }
}

