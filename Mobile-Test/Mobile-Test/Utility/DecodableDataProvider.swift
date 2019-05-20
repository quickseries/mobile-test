//
//  DecodableDataProvider.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-20.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Moya
import Result

class DecodableDataProvider<T: TargetType>: MoyaProvider<T> {
    
    #if DEBUG
    public final class func decodableDefaultRequestMapping(for endpoint: Endpoint, closure: @escaping RequestResultClosure) {
        self.defaultRequestMapping(for: endpoint, closure: { requestClosure in
            switch requestClosure {
            case .success(let request):
                closure(.success(request))
            case .failure(let error):
                closure(.failure(error))
            }
        })
    }
    #endif
    
    @discardableResult
    public func decodableRequest<Y: Decodable>(_ target: T, callbackQueue: DispatchQueue? = .main, progress: ProgressBlock? = nil, failsOnEmptyData: Bool = false, completion: @escaping ((_ result: Result<Y, Error>) -> ())) -> Cancellable {
        return self.request(target, callbackQueue: callbackQueue, progress: progress, completion: { result in
            switch result {
            case .failure(let error):
                completion(Result.failure(error))
            case .success(let value):
                value.decode(Y.self, failsOnEmptyData: failsOnEmptyData, completion: completion)
            }
        })
    }
}

extension Moya.Response {
    
    public func decode<T: Decodable>(_ type: T.Type, atKeyPath keyPath: String? = nil, using decoder: JSONDecoder = JSONDecoder(), failsOnEmptyData: Bool = true, completion: (_ result: Result<T, Error>) -> ()) {
        do {
            completion(try Result.success(self.map(T.self, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)))
        } catch {
            completion(Result.failure(error))
        }
    }
}
