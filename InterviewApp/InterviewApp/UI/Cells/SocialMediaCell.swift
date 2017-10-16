//
//  SocialMediaCell.swift
//  InterviewApp
//
//  Created by Georgi Popov on 2017-10-14.
//  Copyright © 2017 none. All rights reserved.
//

import UIKit
protocol SocialMediaCellDelegate:class {
    func didSelectMedia(with url:URL)
}
class SocialMediaCell: UITableViewCell {
    
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    
    @IBOutlet weak var youtubeBtn: UIButton!
    
    weak var delegate : SocialMediaCellDelegate?
    var urls: [String?] = [nil,nil,nil]
    
    
    @IBAction func socialMediaBtnAction(_ sender: UIButton) {
        if let delegate = self.delegate {
            if let urlString = urls[sender.tag]{
                if let url = URL(string: urlString) {
                    delegate.didSelectMedia(with: url)
                }
            }
        }
    }
}
