//
//  Category.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import Foundation

// MARK: - Category
struct Category: Codable {
    let id, updatedAt, slug, customModuleEid: String?
    let eid, title, categoryDescription: String?
    let v: Int?
    let active: Bool?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case updatedAt = "updated_at"
        case slug
        case customModuleEid = "custom_module_eid"
        case eid, title
        case categoryDescription = "description"
        case v = "__v"
        case active = "_active"
        case createdAt = "created_at"
    }
}

// MARK: Category convenience initializers and mutators

extension Category {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Category.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: String?? = nil,
        updatedAt: String?? = nil,
        slug: String?? = nil,
        customModuleEid: String?? = nil,
        eid: String?? = nil,
        title: String?? = nil,
        categoryDescription: String?? = nil,
        v: Int?? = nil,
        active: Bool?? = nil,
        createdAt: String?? = nil
        ) -> Category {
        return Category(
            id: id ?? self.id,
            updatedAt: updatedAt ?? self.updatedAt,
            slug: slug ?? self.slug,
            customModuleEid: customModuleEid ?? self.customModuleEid,
            eid: eid ?? self.eid,
            title: title ?? self.title,
            categoryDescription: categoryDescription ?? self.categoryDescription,
            v: v ?? self.v,
            active: active ?? self.active,
            createdAt: createdAt ?? self.createdAt
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

