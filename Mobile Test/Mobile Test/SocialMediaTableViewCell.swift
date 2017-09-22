//
//  SocialMediaTableViewCell.swift
//  Mobile Test
//
//  Created by Tom Cheung on 2017-09-22.
//  Copyright © 2017 Tom Cheung. All rights reserved.
//

import UIKit

@objc protocol SocialMediaTableViewCellProtocol {
    @objc optional func openSocialMedia(social:String)
}

class SocialMediaTableViewCell: UITableViewCell {
    
    weak var delegate: SocialMediaTableViewCellProtocol!
    
    var titleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var button:UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        return button
    }()
    
    var mediaString:String?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(button)
        self.updateConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func updateConstraints() {
        super.updateConstraints()
        contentView.addConstraintsWithFormat(format: "H:|-(16)-[v0]", views: titleLabel)
        contentView.addConstraintsWithFormat(format: "V:|-[v0(30)]-|", views: titleLabel)
        contentView.addConstraintsWithFormat(format: "H:[v0(30)]-(16)-|", views: button)
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
    }
    
    func setupButton(type:SocialMediaFields){
        switch type {
        case .youtubeChannel:
            button.addTarget(self, action: #selector(SocialMediaTableViewCell.openSocialMedia), for: .touchUpInside)
            button.setImage(UIImage(named: "youtube"), for: .normal)
            titleLabel.text = "Youtube"
        case .facebook:
            button.addTarget(self, action: #selector(SocialMediaTableViewCell.openSocialMedia), for: .touchUpInside)
            button.setImage(UIImage(named: "facebook"), for: .normal)
            titleLabel.text = "Facebook"
        case .twitter:
            button.addTarget(self, action: #selector(SocialMediaTableViewCell.openSocialMedia), for: .touchUpInside)
            button.setImage(UIImage(named: "twitter"), for: .normal)
            titleLabel.text = "Twitter"
        }
    }
    
    func openSocialMedia(){
        self.delegate.openSocialMedia!(social: mediaString!)
    }
}
