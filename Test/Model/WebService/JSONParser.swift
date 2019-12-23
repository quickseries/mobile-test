//
//  JSONParser.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-19.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import Foundation

class JSONParser {
    
    static func parseData<T: Decodable>(fromJSON data: Data?, type: T.Type, completionHandler: @escaping (T?, NetworkError?) -> Void) {
        do {
            if let jsonData = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .custom { (decoder) -> Date in
                    let value = try decoder.singleValueContainer().decode(String.self)
                    
                    if let date = Constants.DateFormatters.simpleDateFormatter.date(from: value) {
                        return date
                    }
                    
                    throw NetworkError.dateParseError
                }
                
                let jsonObject: T? = try decoder.decode(T.self, from: jsonData)
                completionHandler(jsonObject, nil)
            }
        } catch let error {
            print(error)
            
            completionHandler(nil, .parseError)
        }
    }
}
