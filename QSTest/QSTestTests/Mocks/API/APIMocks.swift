//
//  APIMocks.swift
//  QSTestTests
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation
@testable import QSTest

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}

class URLSessionMock: URLSessionProtocol {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

    var data: Data?
    var error: Error?

    func dataTask(with url: URL, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            completionHandler(self.data, nil, self.error)
        }
    }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            completionHandler(self.data, nil, self.error)
        }
    }
}

extension URLSessionMock {
    class func mockedSession(with file: String?, error: Error?) -> URLSessionMock {
        let sessionMock = URLSessionMock()
        
        if let fileName = file {
            sessionMock.data = Data.load(from: fileName, bundle: Bundle(for: URLSessionMock.self))
        }
        
        sessionMock.error = error
        
        return sessionMock
    }
}
