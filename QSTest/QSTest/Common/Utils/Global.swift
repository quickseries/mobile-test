//
//  Global.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-18.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

/// This API should be used in API handlers, to convert data types or throw an error.
///
/// Usage example:
/// let responseDict: [String: Any] = try convertOrThrow(serviceResponse)
public func convertOrThrow<T>(_ response: Any?) throws -> T {
    guard let result = response as? T else {
        throw NSError.invalidyDataTypeError
    }

    return result
}

/// This is a mehthod to decode generic type from provided `Dictionary` response.
///
/// Usage Example:
/// let model: CustomerProfileModel = try decodeJSONOrThrow(serviceResponse)
///
/// - Parameters:
///   - response: Any object, which could be decoded to a dictionary.
///   - allowDebugPrint: A boolean value indicating wether or not to print JSON response on console.
///                      Default is false
/// - Returns: generic type, that conforms to Decodable protocol
/// - Throws: instance of Error
public func decodeJSONOrThrow<T: Decodable>(_ response: Any?) throws -> T {
    let responseDict: [[String: Any]] = try convertOrThrow(response)

    let data = try JSONSerialization.data(withJSONObject: responseDict, options: [])
    let decoder = JSONDecoder.customDecoder()
    let model = try decoder.decode(T.self, from: data)
    return model
}

/// This is a mehthod to decode generic type from provided `Array` response.
///
/// Usage Example:
/// let model: [SupportModelTopLevelNav] = try decodeArrayJSONOrThrow(serviceResponse)
///
/// - Parameters:
///   - response: Any object, which could be decoded to an array.
///   - allowDebugPrint: A boolean value indicating wether or not to print JSON response on console.
///                      Default is false
/// - Returns: generic type, that conforms to Decodable protocol
/// - Throws: instance of Error
public func decodeArrayJSONOrThrow<T: Decodable>(_ response: Any?) throws -> T {
    let responseArray: [Any] = try convertOrThrow(response)

    _ = try JSONSerialization.data(withJSONObject: responseArray, options: [])
    let decoder = JSONDecoder.customDecoder()
    let model = try decoder.decode(T.self, from: responseArray)
    return model
}

public func weakify <T: AnyObject>(_ owner: T, _ f: @escaping (T) -> () -> Void) -> () -> Void {
    return { [weak owner] in
        return owner.map { f($0)() }
    }
}
