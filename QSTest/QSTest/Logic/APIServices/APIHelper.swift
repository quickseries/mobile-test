//
//  APIHelper.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

typealias APISuccessCallback = ([String: Any]) throws -> Void
typealias APISuccessArrayCallback = ([Any]) throws -> Void
typealias APIFailureCallback = (NSError) -> Void

enum APISuccessType {
    case array(APISuccessArrayCallback?)
    case dict(APISuccessCallback?)
}

protocol APIHelperProtocol {
    init(baseUrl: URL, validateStatusCode: Bool, sessionManager: URLSessionProtocol)
    
    func get(path: String,
             params: [String: String]?,
             headerParams: [String: String]?,
             successArray: APISuccessArrayCallback?,
             failure: APIFailureCallback?)
    func post<T: Sequence>(path: String,
                           params: T?,
                           successArray: APISuccessArrayCallback?,
                           failure: APIFailureCallback?)
    func get(path: String,
             params: [String: String]?,
             headerParams: [String: String]?,
             success: APISuccessCallback?,
             failure: APIFailureCallback?)
    func post<T: Sequence>(path: String,
                           params: T?,
                           success: APISuccessCallback?,
                           failure: APIFailureCallback?)
    func standardPath(with path: String) -> String
}

class APIHelper: NSObject, APIHelperProtocol {
    private let validateStatusCode: Bool
    private let baseUrl: URL!
    private let sessionManager: URLSessionProtocol
    
    required init(baseUrl: URL, validateStatusCode: Bool,
                  sessionManager: URLSessionProtocol = URLSession.default) {
        self.baseUrl = baseUrl
        self.validateStatusCode = validateStatusCode
        self.sessionManager = sessionManager
    }
    
    // MARK: - Success block is Array
    func get(path: String,
             params: [String: String]?,
             headerParams: [String: String]? = nil,
             successArray: APISuccessArrayCallback?,
             failure: APIFailureCallback?) {
        let urlRequest = self.createGetRequest(path: path, params: params, headerParams: headerParams)
        self.dataTask(with: urlRequest, successType: .array(successArray), failure: failure).resume()
    }
    
    func post<T: Sequence>(path: String, params: T?, successArray: APISuccessArrayCallback?, failure: APIFailureCallback?) {
        let urlRequest = self.createPostRequest(path: path, params: params)
        self.dataTask(with: urlRequest, successType: .array(successArray), failure: failure).resume()
    }
    
    // MARK: - Success block is Dictionary
    func get(path: String,
             params: [String: String]?,
             headerParams: [String: String]? = nil,
             success: APISuccessCallback?,
             failure: APIFailureCallback?) {
        let urlRequest = self.createGetRequest(path: path, params: params, headerParams: headerParams)
        self.dataTask(with: urlRequest, successType: .dict(success), failure: failure).resume()
    }
    
    func post<T: Sequence>(path: String, params: T?, success: APISuccessCallback?, failure: APIFailureCallback?) {
        let urlRequest = self.createPostRequest(path: path, params: params)
        self.dataTask(with: urlRequest, successType: .dict(success), failure: failure).resume()
    }
    
    func standardPath(with path: String) -> String {
        return "\(Constants.API.standardPath)\(path)"
    }
}

private extension APIHelper {
    func validate(data: Data?, response: URLResponse?, error: Error?) -> NSError? {
        if let error = error {
            return error as NSError
        } else if validateStatusCode, let response = response as? HTTPURLResponse, response.statusCode != 200 {
            let nserror = NSError(domain: APIHelper.className, code: response.statusCode, userInfo: data?.dict)
            print(nserror)
            return nserror
        }
        
        return nil
    }
    
    func createGetRequest(path: String, params: [String: String]?, headerParams: [String: String]?) -> URLRequest {
        let urlComponents = self.urlComponents(with: path)
        urlComponents.queryItems = params?.map { (key, value) -> URLQueryItem in URLQueryItem(name: key, value: value) }
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        headerParams?.forEach { header in urlRequest.setValue(header.value, forHTTPHeaderField: header.key) }
        
        return urlRequest
    }
    
    func createPostRequest<T: Sequence>(path: String, params: T?) -> URLRequest {
        let urlComponents = self.urlComponents(with: path)
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.setValue(Constants.API.contentTypeKey,
                            forHTTPHeaderField: Constants.API.contentTypeJSON)
        urlRequest.httpBody = params?.data
        urlRequest.httpMethod = Constants.API.httpMethodPost
        
        return urlRequest
    }
    
    func urlComponents(with path: String) -> NSURLComponents {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = baseUrl.scheme
        urlComponents.host = baseUrl.host
        urlComponents.path = baseUrl.path + path
        
        return urlComponents
    }
    
    
    private func dataTask(with urlRequest: URLRequest,
                          successType: APISuccessType,
                          failure: APIFailureCallback?) -> URLSessionDataTask {
        return sessionManager.dataTask(with: urlRequest) { (data: Data?, urlResponse: URLResponse?, error: Error?) in
            if let error = self.validate(data: data, response: urlResponse, error: error) {
                failure?(error)
                return
            }
            
            do {
                switch successType {
                case let .array(successClosure):
                    guard let data = data, let array = data.array else {
                        try successClosure?([])
                        return
                    }
                    
                    try successClosure?(array)
                case let .dict(successClosure):
                    guard let data = data, let dict = data.dict else {
                        try successClosure?([:])
                        return
                    }
                    
                    try successClosure?(dict)
                }
            } catch {
                failure?(NSError.failedToParseResponseError)
            }
        }
    }
}
