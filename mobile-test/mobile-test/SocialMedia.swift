//
//  SocialMedia.swift
//  mobile-test
//
//  Created by Martin Gyupchanov on 09-08-17.
//  Copyright © 2017 Martin Gyupchanov. All rights reserved.
//

import Foundation

struct SocialMedia {
  var youtubeChannel: String?
  var twitter: String?
  var facebook: String?
  
  var allValidProperties = [String]()

  init(youtubeChannel: String?, twitter: String?, facebook: String?){
    self.youtubeChannel = youtubeChannel
    self.twitter = twitter
    self.facebook = facebook
    
    if let youtubeChannel = youtubeChannel {
      allValidProperties.append(youtubeChannel)
    }
    
    if let twitter = twitter {
      allValidProperties.append(twitter)
    }
    
    if let facebook = facebook {
      allValidProperties.append(facebook)
    }
  }
}
