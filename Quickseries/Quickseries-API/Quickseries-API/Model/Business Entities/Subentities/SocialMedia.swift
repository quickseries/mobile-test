//
//  SocialMedia.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

public struct SocialMedia: Codable {
    
    public let youtubeChannel: String?
    public let twitter: String?
    public let facebook: String?
    
    private enum CodingKeys: String, CodingKey {
        case youtubeChannel = "youtubeChannel"
        case twitter = "twitter"
        case facebook = "facebook"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        youtubeChannel = try container.decode([String].self, forKey: CodingKeys.youtubeChannel).first?.nilIfEmpty
        twitter = try container.decode([String].self, forKey: CodingKeys.twitter).first?.nilIfEmpty
        facebook = try container.decode([String].self, forKey: CodingKeys.facebook).first?.nilIfEmpty
    }
}
