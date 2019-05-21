//
//  Resource.swift
//  QSMobileTest
//
//  Created by Munib Siddiqui on 20/05/2019.
//  Copyright © 2019 Munib Siddiqui. All rights reserved.
//

import Foundation

// MARK: - Resource
struct Resource: Codable {
    let id, slug, eid, title: String?
    let resourceDescription: String?
    let bizHours: BizHours?
    let categoryEid: String?
    let v: Int?
    let photo: String?
    let active: Bool?
    let updatedAt, createdAt: String?
    let addresses: [Address]?
    let contactInfo: ContactInfo?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case slug, eid, title
        case resourceDescription = "description"
        case bizHours
        case categoryEid = "category_eid"
        case v = "__v"
        case photo
        case active = "_active"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case addresses, contactInfo
    }
}

// MARK: Resource convenience initializers and mutators

extension Resource {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Resource.self, from: data)
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
        slug: String?? = nil,
        eid: String?? = nil,
        title: String?? = nil,
        resourceDescription: String?? = nil,
        bizHours: BizHours?? = nil,
        categoryEid: String?? = nil,
        v: Int?? = nil,
        photo: String?? = nil,
        active: Bool?? = nil,
        updatedAt: String?? = nil,
        createdAt: String?? = nil,
        addresses: [Address]?? = nil,
        contactInfo: ContactInfo?? = nil
        ) -> Resource {
        return Resource(
            id: id ?? self.id,
            slug: slug ?? self.slug,
            eid: eid ?? self.eid,
            title: title ?? self.title,
            resourceDescription: resourceDescription ?? self.resourceDescription,
            bizHours: bizHours ?? self.bizHours,
            categoryEid: categoryEid ?? self.categoryEid,
            v: v ?? self.v,
            photo: photo ?? self.photo,
            active: active ?? self.active,
            updatedAt: updatedAt ?? self.updatedAt,
            createdAt: createdAt ?? self.createdAt,
            addresses: addresses ?? self.addresses,
            contactInfo: contactInfo ?? self.contactInfo
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Address
struct Address: Codable {
    let address1, city, state, zipCode: String?
    let country, label: String?
}

// MARK: Address convenience initializers and mutators

extension Address {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Address.self, from: data)
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
        address1: String?? = nil,
        city: String?? = nil,
        state: String?? = nil,
        zipCode: String?? = nil,
        country: String?? = nil,
        label: String?? = nil
        ) -> Address {
        return Address(
            address1: address1 ?? self.address1,
            city: city ?? self.city,
            state: state ?? self.state,
            zipCode: zipCode ?? self.zipCode,
            country: country ?? self.country,
            label: label ?? self.label
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
    
    func addressToString() -> String {
        
        return [address1,city,state,zipCode,country].compactMap { $0 }.joined(separator: " ")
    }
}

// MARK: - BizHours
struct BizHours: Codable {
    let sunday, monday,tuesday,wednesday,thursday,friday: Nday?
}

// MARK: BizHours convenience initializers and mutators

extension BizHours {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BizHours.self, from: data)
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
        sunday: Nday?? = nil,
        monday: Nday?? = nil,
        tuesday: Nday?? = nil,
        wednesday: Nday?? = nil,
        thursday: Nday?? = nil,
        friday: Nday?? = nil
        ) -> BizHours {
        return BizHours(
            sunday: sunday ?? self.sunday,
            monday: monday ?? self.monday,
            tuesday: tuesday ?? self.tuesday,
            wednesday: wednesday ?? self.wednesday,
            thursday: thursday ?? self.thursday,
            friday: friday ?? self.friday

        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Nday
struct Nday: Codable {
    let from, to: String?
}

// MARK: Nday convenience initializers and mutators

extension Nday {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Nday.self, from: data)
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
        from: String?? = nil,
        to: String?? = nil
        ) -> Nday {
        return Nday(
            from: from ?? self.from,
            to: to ?? self.to
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ContactInfo
struct ContactInfo: Codable {
    let website: [String]?
    let email,tollFree,faxNumber, phoneNumber: [String]?
}

// MARK: ContactInfo convenience initializers and mutators

extension ContactInfo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ContactInfo.self, from: data)
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
        website: [String]?? = nil,
        email: [String]?? = nil,
        tollFree: [String]?? = nil,
        faxNumber: [String]?? = nil,
        phoneNumber: [String]?? = nil
        ) -> ContactInfo {
        return ContactInfo(
            website: website ?? self.website,
            email: email ?? self.email,
            tollFree: tollFree ?? self.tollFree,
            faxNumber: faxNumber ?? self.faxNumber,

            phoneNumber: phoneNumber ?? self.phoneNumber
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

