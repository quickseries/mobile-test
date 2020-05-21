//
//  Resource.swift
//  QuickSeriesPublishing
//
//  Created by Tony Tran on 2020-05-21.
//  Copyright © 2020 quickseries. All rights reserved.
//

import UIKit

struct Resource: Codable {
    var _id: String? = nil
    var slug: String? = nil
    var eid: String? = nil
    var title: String? = nil
    var description: String? = nil
    var __v: Int = 0
    var _active: Bool = false
    var created_at: String? = nil
    var category_eid: String? = nil
    var photo: URL? = nil
    var socialMedia: SocialMedia? = nil
    var addresses: [Address]? = nil
    var contactInfo: ContactInfo? = nil
}

struct Address: Codable {
    var address: String? = nil
    var city: String? = nil
    var state: String? = nil
    var zipCode: String? = nil
    var country: String? = nil
    var label: String? = nil
    var latitude: String? = nil
    var longitude: String? = nil
    
    private enum RootCodingKeys: String, CodingKey {
        case address = "address1"
        case city, state, zipCode, country, label, gps
    }
    
    private enum NameCodingKeys: String, CodingKey {
        case latitude, longitude
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        address = try container.decode(String.self, forKey: .address)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        zipCode = try container.decode(String.self, forKey: .zipCode)
        country = try container.decode(String.self, forKey: .country)
        label = try container.decode(String.self, forKey: .label)
        
        do {
            let gps = try container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .gps)
            latitude = try gps.decode(String.self, forKey: .latitude)
            longitude = try gps.decode(String.self, forKey: .longitude)
       } catch {

       }
        
        
    }
}

struct SocialMedia: Codable {
    var details = [[String]]()
    
    var youtubeChannel: [String]? = nil
    var twitter: [String]? = nil
    var facebook: [String]? = nil
    
    enum CodingKeys : String, CodingKey {
        case youtubeChannel, twitter, facebook
    }
    
    init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       
       // Parse all values for youtubeChannel
       do {
           var youtubeChannelValues = try container.nestedUnkeyedContainer(forKey: .youtubeChannel)
           var youtubes = [String]()
           
           while (!youtubeChannelValues.isAtEnd) {
               let value = try youtubeChannelValues.decode(String.self)
               youtubes.append(value)
           }
           youtubeChannel = youtubes
        
            if youtubes.count > 0 {
                details.append(youtubes)
            }
       } catch {

       }
        
        // Parse all values for twitter
        do {
            var twitterValues = try container.nestedUnkeyedContainer(forKey: .youtubeChannel)
            var twitters = [String]()
            
            while (!twitterValues.isAtEnd) {
                let value = try twitterValues.decode(String.self)
                twitters.append(value)
            }
            twitter = twitters
            
            if twitters.count > 0 {
                details.append(twitters)
            }
        } catch {

        }
        
        // Parse all values for facebook
        do {
            var facebookValues = try container.nestedUnkeyedContainer(forKey: .youtubeChannel)
            var facebooks = [String]()
            
            while (!facebookValues.isAtEnd) {
                let value = try facebookValues.decode(String.self)
                facebooks.append(value)
            }
            facebook = facebooks
            
            if facebooks.count > 0 {
                details.append(facebooks)
            }
        } catch {

        }
    }
}

struct ContactInfo: Codable {
    var details = [[String: [String]]]()
    
    var website: [String: [String]]? = nil
    var email: [String: [String]]? = nil
    var faxNumber: [String: [String]]? = nil
    var tollFree: [String: [String]]? = nil
    var phoneNumber: [String: [String]]? = nil
    
    enum CodingKeys : String, CodingKey {
        case website, email, faxNumber, tollFree, phoneNumber
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse all values for websites
        do {
            var websiteValues = try container.nestedUnkeyedContainer(forKey: .website)
            var websites = [String]()
            
            while (!websiteValues.isAtEnd) {
                let value = try websiteValues.decode(String.self)
                websites.append(value)
            }
            
            if websites.count > 0 {
                details.append(["WEBSITE": websites])
            }
        } catch {
 
        }
        
        // Parse all values for emails
        do {
            var emailValues = try container.nestedUnkeyedContainer(forKey: .email)
            var emails = [String]()
            
            while (!emailValues.isAtEnd) {
               let value = try emailValues.decode(String.self)
               emails.append(value)
            }
            
            if emails.count > 0 {
                details.append(["EMAIL ADDRESS": emails])
            }
        } catch  {
        }
        
        // Parse all values for faxNumbers
        do {
            var faxValues = try container.nestedUnkeyedContainer(forKey: .faxNumber)
            var faxes = [String]()
            
            while (!faxValues.isAtEnd) {
               let value = try faxValues.decode(String.self)
               faxes.append(value)
            }
            
            if faxes.count > 0 {
                details.append(["FAX NUMBER": faxes])
            }
        } catch  {
        }
        
        // Parse all values for tollFree
        do {
            var tollFreeValues = try container.nestedUnkeyedContainer(forKey: .tollFree)
            var tollFrees = [String]()
            
            while (!tollFreeValues.isAtEnd) {
               let value = try tollFreeValues.decode(String.self)
               tollFrees.append(value)
            }
            
            if tollFrees.count > 0 {
                details.append(["TOLL-FREE NUMBER": tollFrees])
            }
        } catch  {
        }
        
        // Parse all values for phone
        do {
            var phoneValues = try container.nestedUnkeyedContainer(forKey: .phoneNumber)
            var phoneNumbers = [String]()
            
            while (!phoneValues.isAtEnd) {
                let value = try phoneValues.decode(String.self)
                phoneNumbers.append(value)
            }
            
            if phoneNumbers.count > 0 {
                details.append(["PHONE NUMBER": phoneNumbers])
            }
        } catch {
            
        }
    }    
}

