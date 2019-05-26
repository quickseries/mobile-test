//
//  SocialMedia.swift
//  Location
//
//  Created by Nagesh on 25/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import Foundation

enum SocialMediaType {
    
    case youtubeChannel
    case twitter
    case facebook
    
    func contactTitle() -> String {
        switch self {
        case .youtubeChannel: return "youtubeChannel"
        case .twitter: return "twitter"
        case .facebook: return "facebook"
        }
    }
}

struct Social {
    let contactType: SocialMediaType
    let contact : String
}

struct SocialMedia : Codable {
    let youtubeChannel : [String]?
    let twitter : [String]?
    let facebook : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case youtubeChannel = "youtubeChannel"
        case twitter = "twitter"
        case facebook = "facebook"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        youtubeChannel = try values.decodeIfPresent([String].self, forKey: .youtubeChannel)
        twitter = try values.decodeIfPresent([String].self, forKey: .twitter)
        facebook = try values.decodeIfPresent([String].self, forKey: .facebook)
    }
    
    func getSocailMedia() -> [Social] {
        var social = [Social]()
        
        for data in twitter ?? [] {
            let twitter = Social(contactType: .twitter, contact: data)
            social.append(twitter)
        }
        
        for data in youtubeChannel ?? [] {
            let youtubeChannel = Social(contactType: .youtubeChannel, contact: data)
            social.append(youtubeChannel)
        }
        
        for data in facebook ?? [] {
            let facebook = Social(contactType: .facebook, contact: data)
            social.append(facebook)
        }
        
        return social
    }
    
}
