//
//  QuickCache.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation
import UIKit
class QuickCache {
    static let sharedInstance = QuickCache()
    
    public let cache = NSCache<NSString, AnyObject>()
    private var observer: NSObjectProtocol?
    private var defaultTotalCost = 0
    
    init() {
        cache.totalCostLimit = defaultTotalCost * 1024 * 1024
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didReceiveMemoryWarningNotification, object: nil, queue: nil) { [weak self] _ in
            self?.cache.removeAllObjects()
        }
    }
    
    
    init(totalCost: Int) {
        cache.totalCostLimit = totalCost * 1024 * 1024
        observer = NotificationCenter.default.addObserver(forName: UIApplication.didReceiveMemoryWarningNotification, object: nil, queue: nil) { [weak self] _ in
            self?.cache.removeAllObjects()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(observer!)
    }
    
    subscript(url: NSString) -> AnyObject? {
        get {
            return cache.object(forKey: url as NSString)
        }
        
        set {
            if let data = newValue {
                cache.setObject(data, forKey: url as NSString)
            } else {
                cache.removeObject(forKey: url as NSString)
            }
        }
    }
}
