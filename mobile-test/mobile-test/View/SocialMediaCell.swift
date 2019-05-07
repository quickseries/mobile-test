//
//  SocialMediaCell.swift
//  mobile-test
//
//  Created by Ali Pishvaee on 4/26/19.
//  Copyright © 2019 Ali Pishvaee. All rights reserved.
//

import UIKit

class SocialMediaCell: UITableViewCell {
    
    var facebookSelected: (() -> ())?
    var twitterSelected: (() -> ())?
    var youtubeSelected: (() -> ())?
    
    
    var facebook: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "facebook"), for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    
    var twitter: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "twitter"), for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    
    var youtube: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "youtube"), for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    
    @objc func handleFacebook(_ sender: UIButton) {
        facebookSelected?()
    }
    @objc func handleTwitter(_ sender: UIButton) {
        twitterSelected?()
    }
    
    @objc func handleYoutube(_ sender: UIButton) {
        youtubeSelected?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [facebook,twitter,youtube].forEach({ addSubview($0) })
        
        facebook.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 15, bottom: 5, right: 0), size: .init(width: 60, height: 60))
        twitter.anchor(top: topAnchor, leading: facebook.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 0), size: .init(width: 60, height: 60))
        youtube.anchor(top: topAnchor, leading: twitter.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 0), size: .init(width: 60, height: 60))
        
        facebook.addTarget(self, action: #selector(handleFacebook(_:)), for: .touchUpInside)
        twitter.addTarget(self, action: #selector(handleTwitter(_:)), for: .touchUpInside)
        youtube.addTarget(self, action: #selector(handleYoutube(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

