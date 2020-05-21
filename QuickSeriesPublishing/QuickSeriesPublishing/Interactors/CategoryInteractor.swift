//
//  ServiceRequest.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case invalidData
}

protocol CategoryInteracting {
    func fetchCategories(_ completion: @escaping (Result<[Category]>) -> Void)
}

class CategoryInteractor: CategoryInteracting {
    func fetchCategories(_ completion: @escaping (Result<[Category]>) -> Void) {
        do {
            if let bundlePath = Bundle.main.path(forResource: "categories", ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let categories: [Category] = try JSONDecoder().decode([Category].self, from: jsonData)
                completion(.success(categories))                
            }
        } catch {
            completion(.error(ServiceError.invalidData))
        }
    }
}

