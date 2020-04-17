//
//  DataSourceAPI.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-15.
//  Copyright © 2020 Israel Romero. All rights reserved.
//

import UIKit

class DataSourceAPI: NSObject {
    public enum APIError: Error {
        case invalidURL
        case serverError
        case missingData
    }
    
    static let `default` = DataSourceAPI()
    let baseURL = URL(string: "https://raw.githubusercontent.com/quickseries/mobile-test/master/data/")!
    let session = URLSession(configuration: .default)
    
    private func requestData(request: URLRequest, completion: @escaping (Data?, HTTPURLResponse?, Error?)->Void) {
        let task = session.dataTask(with: request) { (data, response, error) in
            completion(data, response as? HTTPURLResponse, error)
        }
        task.resume()
    }
    
    private func fetchLocations(_ request: URLRequest, completion: @escaping (Result<[Location], Error>)->Void) {
        requestData(request: request) { (data, response, error) in
            if let fetchedData = data {
                let decoder = JSONDecoder()
                do {
                    let categories = try decoder.decode([Location].self, from: fetchedData)
                    completion(.success(categories))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(APIError.serverError))
            }
        }
    }
    
    func fetchCategories(_ completion: @escaping (Result<[Category], Error>)->Void) {
        let url = baseURL.appendingPathComponent("categories.json")
        let request = URLRequest(url: url)
        
        requestData(request: request) { (data, response, error) in
            if let fetchedData = data {
                let decoder = JSONDecoder()
                do {
                    let categories = try decoder.decode([Category].self, from: fetchedData)
                    completion(.success(categories))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(APIError.serverError))
            }
        }
    }
    
    func fetchRestaurants(_ completion: @escaping (Result<[Location], Error>)->Void) {
        let url = baseURL.appendingPathComponent("restaurants.json")
        let request = URLRequest(url: url)
        
        fetchLocations(request, completion: completion)
    }
    
    
    func fetchVacationSpots(_ completion: @escaping (Result<[Location], Error>)->Void) {
        let url = baseURL.appendingPathComponent("vacation-spot.json")
        let request = URLRequest(url: url)
        
        fetchLocations(request, completion: completion)
    }
}
