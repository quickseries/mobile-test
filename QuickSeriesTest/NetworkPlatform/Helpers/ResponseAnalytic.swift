//
//  ResponseAnalytic.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2019-05-17.
//  Copyright © 2019 Salar Soleimani. All rights reserved.
//

import Foundation

final class ResponseAnalytics {
  static let printEnabled = true
  
  static func  printResponseData(status: Int, responseData: Data){
    if !printEnabled {return}
    print("\n\n\n\n              ↓-↓-↓-↓-↓-↓-↓-↓-↓- RESPONSE -↓-↓-↓-↓-↓-↓-↓-↓-↓")
    print("STATUS CODE: \(status)\n")
    print(String(bytes: responseData, encoding: .utf8) ?? "")
    print("\n              ↑-↑-↑-↑-↑-↑-↑-↑-↑- RESPONSE -↑-↑-↑-↑-↑-↑-↑-↑-↑\n\n\n\n")
  }
  
  static func printError(status: Int, error: Error) {
    if !printEnabled {return}
    print("\n\n\n\n              ↓-↓-↓-↓-↓-↓-↓-↓-↓- ERRRRRRRR!!! -↓-↓-↓-↓-↓-↓-↓-↓-↓")
    print("STATUS CODE: \(status)\n")
    print("\(error)")
    print("\n              ↑-↑-↑-↑-↑-↑-↑-↑-↑- ERRRRRRRR!!! -↑-↑-↑-↑-↑-↑-↑-↑-↑\n\n\n\n")
  }
}
