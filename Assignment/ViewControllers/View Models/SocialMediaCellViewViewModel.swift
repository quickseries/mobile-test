//
//  SocialMediaCellViewViewModel.swift
//  Assignment
//
//  Created by Syed Hashmi on 4/27/19.
//  Copyright © 2019 QuickSeries. All rights reserved.
//

import Foundation
struct SocialMediaCellViewViewModel {
    private var _youtubeUrl: URL?
    private var _twitterUrl: URL?
    private var _fbUrl: URL?
    init(socialMediaModel: SocialMediaModel?) {
        guard let socialMedia = socialMediaModel else{
            return
        }
        if let strArr = socialMedia.youtubeChannel, strArr.count > 0,  let url = URL(string: strArr[0])  {
            _youtubeUrl = url
        }
        
        if let strArr = socialMedia.twitter, strArr.count > 0,  let url = URL(string: strArr[0])  {
            _twitterUrl = url
        }
        
        if let strArr = socialMedia.facebook, strArr.count > 0,  let url = URL(string: strArr[0])  {
            _fbUrl = url
        }
    }
    
    var youTubeURL: URL? {
        return _youtubeUrl
    }
    var twitterURL: URL? {
        return _twitterUrl
    }
    var fbURL: URL? {
        return _fbUrl
    }
    func getNumberOfRecordsCount() -> Int {
        return 1
    }
}


