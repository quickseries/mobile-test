//
//  BaseNetworkingServices.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import Alamofire
import ObjectMapper
import Foundation

public class BaseNetworkingServices: NSObject
{
    enum Endpoints: String {
        case categories = "categories.json"
    }

    internal var baseURL = "https://raw.githubusercontent.com/AmirDaliri/getTestJson/master/"
    public func request(endpoint:String,
                        method:HTTPMethod,
                        body:Dictionary<String,Any>! = nil,
                        headers: Dictionary<String,String>! = nil,
                        encoding: ParameterEncoding = JSONEncoding.default,
                        completionHandler: @escaping (Result<Any>) -> Void)
    {
        let dataRequest = Alamofire.request("\(self.baseURL)\(endpoint)",
            method: method,
            parameters: body,
            encoding: encoding,
            headers: headers)
        dataRequest.responseJSON { (dataResponse) in
            switch dataResponse.result {
            case .success(let successResult):
                completionHandler(.success(successResult))
                break
            case .failure(_):
                switch dataResponse.response!.statusCode {
                case 300...399: completionHandler(.failure(AppError.createNetworkingError(WithType: .redirection))); return
                case 400...499: completionHandler(.failure(AppError.createNetworkingError(WithType: .client))); return
                case 500...599: completionHandler(.failure(AppError.createNetworkingError(WithType: .server))); return
                default: completionHandler(.failure(AppError.createNetworkingError(WithType: .server))); return
                }
            }
        }
    }
}
