//
//  SocialMediaCell.swift
//  Location
//
//  Created by Nagesh on 26/05/19.
//  Copyright © 2019 Nagesh. All rights reserved.
//

import UIKit

class SocialMediaCell: UITableViewCell {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var socialMedia: [Social]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
    }
    
    func setupButtons() {
        
        var count = 0
        var px = 0
        var py = 0
        
        if socialMedia!.count > 0 {
            for j in (socialMedia?.enumerated())! {
                count += 1
                let button = UIButton()
                button.tag = count
                button.frame = CGRect(x: px+10, y: py+10, width: 40, height: 40)
                button.setImage(UIImage(named: j.element.contactType.contactTitle()), for: .normal)
                button.addTarget(self, action: #selector(scrollButtonAction), for: .touchUpInside)
                button.layer.cornerRadius = (button.bounds.width)/2
                button.clipsToBounds = true
                scrollView.addSubview(button)
                px = px + Int(scrollView.frame.width)/2 - 100
            }
            py =  Int(scrollView.frame.height)-70
            scrollView.contentSize = CGSize(width: px, height: py)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    @objc func scrollButtonAction(sender: UIButton) {
        print(" \(socialMedia?[sender.tag - 1].contactType.contactTitle() ?? "") is Selected")
    }
}
