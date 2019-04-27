
//
//  SocialMediaModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/27/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
public class SocialMediaModel: Object, Codable{
    dynamic public var youtubeChannel: List<String>?     //[""],
    dynamic public var twitter: List<String>?              //[""],
    dynamic public var facebook: List<String>?         //[""]
    
    enum CodingKeys: String, CodingKey {
        case youtubeChannel
        case twitter
        case facebook
    }
    
    convenience init(youtubeChannel: List<String>?,
                     twitter: List<String>?,
                     facebook: List<String>?) {
        self.init()
        self.youtubeChannel = youtubeChannel
        self.twitter = twitter
        self.facebook = facebook
    }
    
    var youtubeChannelArray:[String]?{
        var youtubeChannelArray:[String]? = nil
        if let youtubeChannelList = youtubeChannel  {
            youtubeChannelArray = Array(youtubeChannelList)
        }
        return youtubeChannelArray
    }
    
    var twitterArray:[String]?{
        var twitterArray:[String]? = nil
        if let twitterList = twitter  {
            twitterArray = Array(twitterList)
        }
        return twitterArray
    }
    
    var facebookArray:[String]?{
        var facebookArray:[String]? = nil
        if let facebookList = facebook  {
            facebookArray = Array(facebookList)
        }
        return facebookArray
    }
    
    convenience required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let youtubeChannelArray = try container.decodeIfPresent([String].self, forKey: .youtubeChannel)
        let youtubeChannel = List<String>()
        if let youtubeChannelArray = youtubeChannelArray {
            youtubeChannel.append(objectsIn: youtubeChannelArray)
        }
        
        let twitterArray = try container.decodeIfPresent([String].self, forKey: .twitter)
        let twitter = List<String>()
        if let twitterArray = twitterArray {
            twitter.append(objectsIn: twitterArray)
        }
        
        let facebookArray = try container.decodeIfPresent([String].self, forKey: .facebook)
        let facebook = List<String>()
        if let facebookArray = facebookArray{
            facebook.append(objectsIn: facebookArray)
        }
        
        self.init(youtubeChannel : youtubeChannel, twitter : twitter, facebook : facebook)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        var youtubeChannelArray:[String]? = nil
        if let youtubeChannelList = youtubeChannel  {
            youtubeChannelArray = Array(youtubeChannelList)
        }
        try container.encode(youtubeChannelArray, forKey: .youtubeChannel)
        
        var twitterArray:[String]? = nil
        if let twitterList = twitter  {
            twitterArray = Array(twitterList)
        }
        try container.encode(twitterArray, forKey: .twitter)
        
        var facebookArray:[String]? = nil
        if let facebookList = facebook  {
            facebookArray = Array(facebookList)
        }
        try container.encode(facebookArray, forKey: .facebook)
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}
