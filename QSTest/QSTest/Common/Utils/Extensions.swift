//
//  Extensions.swift
//  QSTest
//
//  Created by Denys Volkov on 2020-05-17.
//  Copyright © 2020 quickseries. All rights reserved.
//

import Foundation

extension NSError {
    class var failedToParseResponseError: NSError {
        return NSError(domain: Constants.Error.apiDomain,
                       code: Constants.Error.defaultErrorCode,
                       userInfo: [NSLocalizedDescriptionKey: "parse_error".localized])
    }
    
    class var invalidyDataTypeError: NSError {
        return NSError(domain: Constants.Error.apiDomain,
                       code: Constants.Error.defaultErrorCode,
                       userInfo: [NSLocalizedDescriptionKey: "invalid_data_type_error".localized])
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}

extension JSONDecoder {
    static func customDecoder() -> JSONDecoder {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.DateFormats.main
        let decoder: JSONDecoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        return decoder
    }
}

extension JSONEncoder {
    static func customEncoder() -> JSONEncoder {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.DateFormats.main
        let encoder: JSONEncoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(formatter)
        
        return encoder
    }
}

extension URLSession {
    static var `default`: URLSession {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = TimeInterval(10)
        config.timeoutIntervalForResource = TimeInterval(10)
        return URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue.main)
    }
}

extension Data {
    var dict: [String: Any]? {
        return (try? JSONSerialization.jsonObject(with: self, options: [])) as? [String: Any]
    }
    
    var array: [Any]? {
        return (try? JSONSerialization.jsonObject(with: self, options: [])) as? [Any]
    }
    
    static func load(from jsonFile: String, bundle: Bundle = Bundle.main)  -> Data {
        guard let urlString = bundle.path(forResource: jsonFile, ofType: "json"),
            let url = URL(string: urlString) else {
            fatalError("Failed to locate \(jsonFile) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(jsonFile) from bundle.")
        }
        
        return data
    }
}

extension Sequence {
    var data: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: [])
    }
    
    var jsonString: String? {
        let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        return jsonString
    }
}

extension JSONDecoder {

    /// This is convinience mehtod to decode generic type from provided `Any` object.
    ///
    /// - Parameters:
    ///   - type: generic type, that conforms to Decodable protocol
    ///   - obj: Any object. Usially it's array or dictionary that should be decoded.
    /// - Returns: generic type, that conforms to Decodable protocol
    /// - Throws: instance of Error
    func decode<T: Decodable>(_ type: T.Type, from obj: Any?) throws -> T {
        guard let object = obj,
            let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            throw DecodingError.valueNotFound(T.self, DecodingError.Context(codingPath: [], debugDescription: "Value can't be converted to Data type"))
        }

        return try self.decode(type, from: data)
    }
}
