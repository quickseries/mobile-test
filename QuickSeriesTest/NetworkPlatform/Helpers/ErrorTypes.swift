//
//  ErrorTypes.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

public enum InternalErrorCodes: Int {
  case jsonParsingError = -10024
}

public enum ErrorTypes: String{
  case internalError = "InternalError"
  case externalError = "ExternalError"
}
