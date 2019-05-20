//
//  Restaurant.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

struct Restaurant: Codable {
    var id: String
    var title: String
    var description: String?
    var addresses: [Address]?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, description, addresses
    }
}

struct Address: Codable {
    var address1: String
    var city: String
    var state: String
    var gps: GpsCoordinate?
}

struct GpsCoordinate: Codable {
    var latitude: String
    var longitude: String
}
