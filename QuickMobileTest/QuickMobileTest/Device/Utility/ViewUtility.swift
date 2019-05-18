//
//  ViewUtility.swift
//  QuickMobileTest
//
//  Created by Balaji Galave on 5/18/19.
//

import Foundation
import UIKit

struct ViewUtility {
    
    // MARK: StoryBaord Utility Methods
    fileprivate static func getMainStoryBaord() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    // MARK: ViewController Utility Methods
    static func getCategoryListViewController() -> CategoryListViewController? {
        let storyBoard = getMainStoryBaord()
        let id = "CategoryListViewController"
        return storyBoard.instantiateViewController(withIdentifier: id) as? CategoryListViewController
    }
    
    static func getResourceListViewController() -> ResourceListViewController? {
        let storyBoard = getMainStoryBaord()
        let id = "ResourceListViewController"
        return storyBoard.instantiateViewController(withIdentifier: id) as? ResourceListViewController
    }
    
}
