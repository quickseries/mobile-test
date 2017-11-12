//
//  SocialMedia.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation
import ObjectMapper

struct SocialMedia : Mappable {
    
    var youtubeChannel : [String]?
    var twitter : [String]?
    var facebook : [String]?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        youtubeChannel           <- map["youtubeChannel"]
        twitter             <- map["twitter"]
        facebook       <- map["facebook"]
    }
}
