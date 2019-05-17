//
//  Network.swift
//  NetworkPlatform
//
//  Created by Behrad Kazemi on 11/20/18.
//  Copyright © 2018 Behrad Kazemi. All rights reserved.
//
import Foundation
import Alamofire
import RxAlamofire
import RxSwift

final class Network<T: Codable> {
  
  private let endPoint: String
  private let scheduler: ConcurrentDispatchQueueScheduler
  private var sharedHeaders: Dictionary<String,String> {
    // Can be done later for the specific app we want
    return ["":""]
  }
  init(_ endPoint: String) {
    self.endPoint = endPoint
    self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
  }
  
  func getItems(_ path: String, itemId: String = "") -> Observable<[T]> {
    let absolutePath = itemId == "" ? endPoint + path : endPoint + "\(path)/\(itemId)"
    
    return RxAlamofire
      .request(.get, absolutePath, headers: sharedHeaders)
      .debug()
      .observeOn(scheduler)
      .responseData()
      .map({ [unowned self] (json) -> [T] in
        ResponseAnalytics.printResponseData(status: json.0.statusCode, responseData: json.1)
        if 200 ... 299 ~= json.0.statusCode{
          do {
            return try JSONDecoder().decode([T].self, from: json.1)
          } catch let err {
            print("decoder error : \(err) ___ \(String(bytes: json.1, encoding: .utf8) ?? "")")
          }
        }
        throw self.handle(data: json.1, StatusCode: json.0.statusCode)
      })
  }
  func getItem(_ path: String, itemId: String = "") -> Observable<T> {
    let absolutePath = itemId == "" ? endPoint + path : endPoint + "\(path)/\(itemId)"
    
    return RxAlamofire
      .request(.get, absolutePath, headers: sharedHeaders)
      .debug()
      .observeOn(scheduler)
      .responseData()
      .map({ [unowned self] (json) -> T in
        ResponseAnalytics.printResponseData(status: json.0.statusCode, responseData: json.1)
        if 200 ... 299 ~= json.0.statusCode {
          do {
            return try JSONDecoder().decode(T.self, from: json.1)
          } catch let err {
            print("decoder error : \(err) ___ \(String(bytes: json.1, encoding: .utf8) ?? "")")
          }
        }
        throw self.handle(data: json.1, StatusCode: json.0.statusCode)
    })
  }
  func handle(data: Data, StatusCode code: Int) -> NSError {
    do {
      let responseError = try JSONDecoder().decode(ResponseMessage.Base.self, from: data)
      
      return NSError(domain: ErrorTypes.externalError.rawValue, code: code, userInfo: ["responseError": responseError])
    }catch{
      return NSError(domain: ErrorTypes.internalError.rawValue, code: code, userInfo: ["data" : data])
    }
  }
}
