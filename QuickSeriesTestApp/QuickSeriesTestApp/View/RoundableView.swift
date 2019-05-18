//
//  RoundableView.swift
//  QuickSeriesTestApp
//
//  Created by Kasra Abasi on 5/18/19.
//  Copyright © 2019 noxowl. All rights reserved.
//

import UIKit

// this could be done by subclassing and @IBInspectable @IBDesignable but this is the protocol oriented approach and add a lot of value for future

protocol RoundableViews: class {
    var cornerRadius: CGFloat { get }
}

extension RoundableViews where Self: UIView {
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
}



class RoundableView: UIView, RoundableViews {
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = 8.0
    }
}



class RoundableImageView: UIImageView, RoundableViews {
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = 8.0
    }
}



class RoundableButton: UIButton, RoundableViews {
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadius = 8.0
    }
}
