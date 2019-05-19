//
//  AppError.swift
//  Hobbies
//
//  Created by Amir Daliri on 5/18/19.
//  Copyright © 2019 ADA-Company. All rights reserved.
//

import UIKit

public enum NetworkingErrorTypes: Int
{
    case unknown
    case jsonParsing
    case redirection
    case client
    case server
}


public class AppError: BaseModel
{
    public var networkingErrorType: NetworkingErrorTypes?
    public var statusCode: Int?
    public var serverError: Error?
    public var description: String = "Unknown Error!"
    
    public var localizedDescription: String {
        return description
        
    }
}

extension AppError
{
    public static func createNetworkingError(WithType errorType: NetworkingErrorTypes) -> AppError
    {
        let error = AppError()
        error?.networkingErrorType = errorType
        switch errorType {
        case .jsonParsing:
            error?.description = "Json parsing error"
        default:
            error?.description = "Unknown Error!"
            break
        }
        return error!
    }
}

extension AppError: Error
{
    
}
