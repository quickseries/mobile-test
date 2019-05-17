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
    
    public  func loadData(fileName: String, completionHandler: @escaping (_ result: Data) ->Void) {
        
        let operation = LoadJsonOperation(fileName: fileName)
        operation.qualityOfService = .background
        operation.queuePriority = .veryHigh
        operation.completionHandler = completionHandler
        operation.name = fileName
        queueManager.enqueue(operation)
        
    }
    

}
