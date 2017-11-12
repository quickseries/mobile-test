//
//  SocialMediaTableViewCell.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit

class SocialMediaTableViewCell: UITableViewCell {

    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var twtButton: UIButton!
    @IBOutlet weak var ytButton: UIButton!
    
    var fblink: String = ""
    var twterLink: String = ""
    var ytLink: String = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setSocialMedia(socialMedia: SocialMedia?) {
        
        guard let media = socialMedia else { return }
        
        if let fb = media.facebook {
            self.fblink = fb.first ?? ""
        }
        else {
            self.fbButton.isHidden = true
        }
        
        
        if let twt = media.twitter {
            self.twterLink = twt.first ?? ""
        }
        else {
            self.twtButton.isHidden = true
        }
        
        
        if let yt = media.youtubeChannel {
            self.ytLink = yt.first ?? ""
        }
        else {
            self.ytButton.isHidden = true
        }
    }

    @IBAction func openFacebook() {
        
        guard let url = URL(string: self.fblink) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url,
                                      options: [:],
                                      completionHandler: nil)
        }
    }
    
    @IBAction func openTwitter() {
        guard let url = URL(string: self.twterLink) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url,
                                      options: [:],
                                      completionHandler: nil)
        }
    }
    
    @IBAction func openYoutube() {
     
        guard let url = URL(string: self.ytLink) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url,
                                      options: [:],
                                      completionHandler: nil)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
