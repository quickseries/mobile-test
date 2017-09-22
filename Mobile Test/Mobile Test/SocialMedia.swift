//
//  SocialMedia.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-21.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import Foundation

enum SocialMediaFields:String{
    case youtubeChannel = "youtubeChannel"
    case twitter = "twitter"
    case facebook = "facebook"
}

class SocialMedia: NSObject {
    var youtubeChannel:[MediaType] = []
    var twitter:[MediaType] = []
    var facebook:[MediaType] = []
    var allSocialMedia:[MediaType] = []
    
    required init(json: [String:Any]) {

        if let youtubeChannels = json[SocialMediaFields.youtubeChannel.rawValue] as? [String]{
            for channel in youtubeChannels{
                if !channel.isStringEmpty(){
                    self.youtubeChannel.append(MediaType(type: SocialMediaFields.youtubeChannel.rawValue, details: channel))
                }
            }
        }
        
        if let twitterAccounts = json[SocialMediaFields.twitter.rawValue] as? [String]{
            for twitterAccount in twitterAccounts{
                if !twitterAccount.isStringEmpty(){
                    self.twitter.append(MediaType(type: SocialMediaFields.twitter.rawValue, details: twitterAccount))
                }
            }
        }
        
        if let facebookAccounts = json[SocialMediaFields.facebook.rawValue] as? [String]{
            for facebookAccount in facebookAccounts{
                if !facebookAccount.isStringEmpty(){
                    self.facebook.append(MediaType(type: SocialMediaFields.facebook.rawValue, details: facebookAccount))
                }
            }
        }
        
        self.allSocialMedia = self.youtubeChannel + self.twitter + self.facebook
    }
}

class MediaType:NSObject {
    var type:String
    var details:String
    
    init(type:String, details:String) {
        self.type = type
        self.details = details
    }
}
