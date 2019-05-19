//
//  Coordinate.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct Coordinates: Codable {
    
    public let latitude: Double
    public let longitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = Double(try container.decode(String.self, forKey: CodingKeys.latitude))!
        longitude = Double(try container.decode(String.self, forKey: CodingKeys.longitude))!
    }
}
