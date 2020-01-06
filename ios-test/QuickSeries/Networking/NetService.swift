//  NetService.swift
//  QuickSeries
//
//  Created by Franck Clement on 04/01/2020.
//  Copyright © 2020 Franck Clement. All rights reserved.

import Foundation

/// Simple Remote Service abstraction
protocol NetService {
    /// The output Type, must conform to Decodable
    associatedtype Item: Decodable
    /// The Session on which the remote data is beiing fetched
    var session: URLSession { get }
    /// The URL to fetch data from
    var url: URL { get }
}

/// Provides a default implementation for every type that conforms to `NetService`
extension NetService {
    
    /// Fetch data from `url` in background with `session` dataTask
    /// and returns either `Item` objects decoded from JSON data or Error
    /// - Parameter completion: the completion handler called when the task is done.
    @discardableResult
    func fetch(completion: @escaping (Result<Item, Error>) -> ()) -> URLSessionDataTask {
        let task = session.dataTask(with: self.url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(Result.failure(error))
                }
            } else if let data = data {
                let decoder = JSONDecoder()
                let result = Result { try decoder.decode(Item.self, from: data) }
                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
        
        task.resume()
        return task
    }
}
