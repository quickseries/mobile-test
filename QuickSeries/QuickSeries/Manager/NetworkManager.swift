//
//  NetworkManager.swift
//  QuickSeries
//
//  Created by Parth Patel on 14/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation
import UIKit

enum APIEndPoint: String {
    case categories = "categories.json"
    case restaurants = "restaurants.json"
    case vacation = "vacation-spot.json"
}

enum Endpoint {
    case category
    case restaurant
    case vacations
}


class NetworkManager {
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    let baseURL = "https://raw.githubusercontent.com/quickseries/mobile-test/master/data/"
    let session = URLSession(configuration: URLSessionConfiguration.ephemeral)

    private init() {}
    

    // MARK: - Fetch Categories
    
    func getCategories(completed: @escaping (Result<[Categories], ErrorMessage>) -> Void) {
        
        let endpoint = baseURL + APIEndPoint.categories.rawValue
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidRequest))
            return
        }
                
        let task = session.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let category = try decoder.decode([Categories].self, from: data)
                completed(.success(category))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    // MARK: - Fetch Resources
    
    func getResources(slug: String, completed: @escaping (Result<[Resources], ErrorMessage>) -> Void) {
        var slug = slug
        if slug == "vacation-spots" {
            slug = "vacation-spot"
        }

        let endpoint = baseURL + "\(slug).json"

        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidRequest))
            return
        }

        let task = session.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let resources = try decoder.decode([Resources].self, from: data)
                completed(.success(resources))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    // MARK: - Download Media
    
    func downloadImage(imageView:UIImageView, urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            imageView.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async { imageView.image = image }
        }
        task.resume()
    }
}
