//
//  QuickOperationManager.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation


class QuickOperationManager {
public let queueManager: QuickOperationQueue

// MARK: - Init

public init() {
    self.queueManager = QuickOperationQueue.sharedInstance
    
}

    
    
    // MARK Load AnyData
    
    public  func loadData(fileName: String, completionHandler: @escaping (_ result: AnyObject) ->Void) {
        
        let operation = LoadDataOperation(fileName: fileName)
        operation.qualityOfService = .background
        operation.queuePriority = .veryHigh
        operation.completionHandler = completionHandler
        operation.name = fileName
        queueManager.enqueue(operation)
        
    }
    
    
    public  func loadImage(urlString: String, completionHandler: @escaping (_ result: AnyObject) ->Void) {
        
        let operation = LoadDataOperation(url: urlString, opType: true)
        operation.qualityOfService = .background
        operation.queuePriority = .veryHigh
        operation.completionHandler = completionHandler
        operation.name = urlString
        queueManager.enqueue(operation)
        
    }

}
