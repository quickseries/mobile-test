//
//  AppDelegate.swift
//  QuickSeriesTest
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import UIKit
import NetworkPlatform

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setupNavigationUI()
    setupMainView()
    return true
  }
  
  /**
   Set the navigation bar UI
   
   * Set the navigation bar item to large title
   * Set the font of navigation title
   * Set back button only show icon
   * Set tint
   
   - Author: Salar Soleimani
   */
  private func setupNavigationUI() {
    let largTitleNavFont = Font(.installed(.MontserratBold), size: .standard(.h3)).instance
    let attributes = [
      NSAttributedString.Key.foregroundColor: NamedColor.darkText.value,
      NSAttributedString.Key.font: largTitleNavFont
    ]
    UINavigationBar.appearance().titleTextAttributes = attributes
    UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for:UIBarMetrics.default)
    UINavigationBar.appearance().tintColor = NamedColor.beautifulRed.value
    UINavigationBar.appearance().isTranslucent = true
    
    // Add bottom border
    UINavigationBar.appearance().shadowImage = NamedColor.beautifulRed.value.as2ptImage()
  }
  /**
   Configuring the main view (resource categories)
   
   * Add navigation controller behind the main view
   * Set window
   
   - Author: Salar Soleimani
   */
  private func setupMainView() {
    let vc = CategoriesViewController()
    let categoriesNavVC = UINavigationController(rootViewController: vc)
    let networkUseCaseProvider = NetworkPlatform.UseCaseProvider()
    let categoriesNavigator = CategoriesNavigator(services: networkUseCaseProvider, navigationController: categoriesNavVC)
    categoriesNavigator.setup(vc)
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.backgroundColor = .white
    window.rootViewController = categoriesNavVC
    window.makeKeyAndVisible()
    self.window = window
  }
}

