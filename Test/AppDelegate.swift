//
//  AppDelegate.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navViewController = self.window?.rootViewController as! UINavigationController
        let categoryViewController = navViewController.topViewController as! CategoriesVC
        categoryViewController.title = "Category"
        
        return true
    }
}
