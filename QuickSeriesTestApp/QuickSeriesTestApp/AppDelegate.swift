//
//  AppDelegate.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/17/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?


    
    // MARk: - Lifecycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.tintColor = Constants.Color.qsRed
        return true
    }



}

