//
//  SocialMedia.swift
//  Test
//
//  Created by HARDIK-SNEHAL on 2019-12-20.
//  Copyright © 2019 HARDIK-SNEHAL. All rights reserved.
//

import Foundation

struct SocialMedia: Decodable {
    
    var youtubeChannel: String
    var twitter: String
    var facebook: String
    
    enum CodingKeys: String, CodingKey {
        case youtubeChannel
        case twitter
        case facebook
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.youtubeChannel = try container.decode(String.self, forKey: .youtubeChannel)
        self.twitter = try container.decode(String.self, forKey: .twitter)
        self.facebook = try container.decode(String.self, forKey: .facebook)
    }
}
