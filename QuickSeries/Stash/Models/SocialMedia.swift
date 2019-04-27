//
//  SocialMedia.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/26/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import RealmSwift
import ObjectMapper
import ObjectMapperAdditions

class SocialMedia: Object,Mappable {

    var youtube = List<String>()
    var facebook = List<String>()
    var twitter = List<String>()

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        youtube <- (map["youtubeChannel"], RealmTransform())
        facebook <- (map["twitter"], RealmTransform())
        twitter <- (map["facebook"], RealmTransform())

    }

}
