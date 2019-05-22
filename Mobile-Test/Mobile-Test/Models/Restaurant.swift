//
//  Restaurant.swift
//  Mobile-Test
//
//  Created by Leopold Roitel on 2019-05-18.
//  Copyright © 2019 Leopold. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    var id: String
    var title: String
    var description: String?
    var addresses: [Address]?
    var photo: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title, description, addresses, photo
    }
    
    public init(from decoder: Decoder) throws {
        let allValues = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try allValues.decode(String.self, forKey: .id)
        self.title = try allValues.decode(String.self, forKey: .title)
        self.description = try allValues.decodeIfPresent(String.self, forKey: .description)?.html2String
        self.addresses = try allValues.decodeIfPresent([Address].self, forKey: .addresses)
        self.photo = try URL(string: allValues.decodeIfPresent(String.self, forKey: .photo) ?? "")
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
