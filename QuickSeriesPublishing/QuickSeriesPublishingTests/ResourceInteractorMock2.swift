//
//  QuickSeriesPublishingTests.swift
//  QuickSeriesPublishingTests
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import XCTest
@testable import QuickSeriesPublishing

class ResourceInteractorMock2: ResourceInteracting {
      func fetchResource(_ id: String, completion: @escaping (Result<[Resource]>) -> Void) {
          do {
              if let bundlePath = Bundle.main.path(forResource: "restaurants2", ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                  let resources: [Resource] = try JSONDecoder().decode([Resource].self, from: jsonData)
                  completion(.success(resources))
              }
          } catch {
              completion(.error(ServiceError.invalidData))
          }
      }
    

}

