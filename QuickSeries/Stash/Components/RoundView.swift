//
//  RoundView.swift
//  QuickSeries
//
//  Created by Ramiz Rafiq on 4/27/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit

class RoundView: UIView {
    
    @IBInspectable public var cornerRadius:CGFloat = 15.0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
