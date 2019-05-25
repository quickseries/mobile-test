//
//  DataManager.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation
import Moya

class DataManager {
    
    let provider = MoyaProvider<APIService>(stubClosure: MoyaProvider.immediatelyStub)
    
    func getCategories(completionHandler: @escaping ( _ categories: [Categories], _ error: Error?) -> Void) {
        provider.request(.categories) { result in
            switch result {
            case let .success(moyaResponse):
                
                do {
                    let data = moyaResponse.data
                    let jsonDecoder = JSONDecoder()
                    guard let responseModel = try jsonDecoder.decode([Categories]?.self, from: data) else {
                        completionHandler([],nil)
                        return
                    }
                    completionHandler(responseModel, nil)
                } catch {
                    print("MoyaError")
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getLocation(target: TargetType, completionHandler: @escaping ( _ categories: [Location], _ error: Error?) -> Void) {
        provider.request(target as! APIService) { result in
            switch result {
            case let .success(moyaResponse):
                
                do {
                    let data = moyaResponse.data
                    let jsonDecoder = JSONDecoder()
                    guard let responseModel = try jsonDecoder.decode([Location]?.self, from: data) else {
                        completionHandler([],nil)
                        return
                        
                    }
                    completionHandler(responseModel, nil)
                } catch {
                    print("MoyaError")
                    
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
