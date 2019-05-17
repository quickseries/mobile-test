//
//  ResponseMessage.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

public enum ResponseMessage {
  public struct Base: Codable {
    public let code: Int
    //    public let status: Int
    public let message: String
  }
}
