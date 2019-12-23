//
//  Network.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    static func loadRequest<T: Decodable>(requestURL: URL, type: T.Type, completionHandler: @escaping (T?, NetworkError?) -> Void) {
        
        Alamofire.request(requestURL).responseData { (resData) -> Void in
            
            let statusCode = (resData.response)?.statusCode ?? 200
            
            if statusCode != 200 {
                completionHandler(nil, .requestError)
            } else {
                self.processCategoryRequest(data: resData.result.value, type: type, completionHandler: completionHandler)
            }
        }
    }
    
    static func processCategoryRequest<T: Decodable>(data: Data?, type: T.Type, completionHandler: @escaping (T?, NetworkError?) -> Void) {
        guard let jsonData = data else {
            completionHandler(nil, .requestError)
            return
        }
    return JSONParser.parseData(fromJSON: jsonData, type: type, completionHandler: completionHandler)
    }
}
