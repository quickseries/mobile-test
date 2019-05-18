//
//  QuickOperationQueue.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation


public class  QuickOperationQueue {
    
    
    // MARK: - Singleton
    
    static let sharedInstance = QuickOperationQueue()
    
    lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "QuickOperationQueue"
        queue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount
        return queue;
    }()
    
    
    
    // MARK: - Addition
    
    func enqueue(_ operation: Operation) {
        queue.addOperation(operation)
    }
}

