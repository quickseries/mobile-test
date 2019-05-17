//
//  SocialMedia.swift
//  Quickseries-API
//
//  Created by Thiago Magalhaes on 2019-05-17.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation

struct SocialMedia: Codable {
    
    let youtubeChannel: String?
    let twitter: String?
    let facebook: String?
    
    enum CodingKeys: String, CodingKey {
        case youtubeChannel = "youtubeChannel"
        case twitter = "twitter"
        case facebook = "facebook"
    }
}
