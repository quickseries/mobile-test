//
//  Service+Cache.swift
//  mobileTest
//
//  Created by Balraj Singh on 13/04/19.
//  Copyright © 2019 balraj. All rights reserved.
//

import Foundation
import PromiseKit

extension Service {
  public func fetch<T>(forKey key: String) -> Promise<T> {
    return DispatchQueue
      .global(qos: .utility)
      .async(PMKNamespacer.promise) { () throws -> T in
        guard let cacheValue = (AppEnvironment.current.cache[key] as? T) else {
          throw FACacheError.noValueFound
        }
        
        return cacheValue
    }
  }
  
  public func cache<T>(key: String)
    -> (_ response: Promise<T>)
    -> Promise<T> {
      return { (response: Promise<T>) -> Promise<T> in
        return response.tap(on: DispatchQueue.global(qos: .utility)) {
          _  = $0.map { AppEnvironment.current.cache[key] = $0 }
        }
      }
  }
}
