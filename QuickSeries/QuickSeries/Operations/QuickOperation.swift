//
//  QuickOperation.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation




class QuickOperation<T>: Operation {
    
    
    
    typealias OnCompletionHandler = (_ result: AnyObject) -> Void
    var completionHandler: (OnCompletionHandler)?
    // MARK: - State
    private enum State: String {
        case ready = "isReady"
        case executing = "isExecuting"
        case finished = "isFinished"
        
    }
    
    private var state = State.ready {
        willSet {
            willChangeValue(forKey: newValue.rawValue)
            willChangeValue(forKey: state.rawValue)
        }
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.rawValue)
        }
    }
    
    
    override var isReady: Bool {
        return super.isReady && state == .ready
    }
    
    override var isExecuting: Bool {
        return state == .executing
    }
    
    override var isFinished: Bool {
        return state == .finished
    }
    
    
    // MARK: - Start
    
    override func start() {
        guard !isCancelled else {
            finish()
            return
        }
        
        if !isExecuting {
            state = .executing
        }
        
        main()
    }
    
    // MARK: - Finish
    
    func finish() {
        if isExecuting {
            state = .finished
        }
    }
    
    func complete(result: AnyObject) {
        finish()
        
        if !isCancelled {
            completionHandler?(result)
        }
    }
    
    // MARK: - Cancel
    
    override func cancel() {
        super.cancel()
        
        finish()
    }
    
}

