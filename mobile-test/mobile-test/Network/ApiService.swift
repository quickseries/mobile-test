//
//  ApiService.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/25/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ApiService: NSObject {
    func getData < T: Decodable > (url: String, completion : @escaping (T) -> ()) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseData { (response) in
            
            guard let data = response.result.value else { return }
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            } catch let error as NSError { print("Error: \(error)") }
        }
    }
    
}




