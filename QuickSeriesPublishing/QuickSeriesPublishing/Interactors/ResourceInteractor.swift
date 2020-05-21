//
//  ResourceService.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

protocol ResourceInteracting {
    func fetchResource(_ id: String, completion: @escaping (Result<[Resource]>) -> Void)
}

class ResourceInteractor: ResourceInteracting {
    func fetchResource(_ id: String, completion: @escaping (Result<[Resource]>) -> Void) {
        do {
            if let bundlePath = Bundle.main.path(forResource: "restaurants", ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let resources: [Resource] = try JSONDecoder().decode([Resource].self, from: jsonData)
                completion(.success(resources))                
            }
        } catch {
            completion(.error(ServiceError.invalidData))
        }
    }
}
