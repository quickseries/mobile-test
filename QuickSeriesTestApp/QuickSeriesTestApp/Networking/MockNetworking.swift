//
//  MockNetworking.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import Foundation

struct MockNetworking  {
    
    // MARK: - Types
    enum DecodeResult<U> {
        case success([U])
        case failure(MockNetworkingError)
    }
    enum MockNetworkingError: Error {
        case fileNotFound
        case decodeFailed
    }
    
    
    
    // MARK: - Methods
    func decodeJSON<T: Decodable>(for: T.Type = T.self, fileName: String, completion: @escaping (DecodeResult<T>) -> Void) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            completion(.failure(.fileNotFound))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([T].self, from: data)
            completion(.success(jsonData))
        } catch let error {
            print(error)
            completion(.failure(.decodeFailed))
        }
    }
}
