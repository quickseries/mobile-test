//
//  PaymentViewShadow.swift
//  Idealz
//
//  Created by Ramiz Rafiq on 1/3/19.
//  Copyright © 2019 Ramiz Rafiq. All rights reserved.
//

import UIKit

class CustomShadow: RoundView {

    override func layoutSubviews() {
        
        let layer = self.layer
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.02

    }

}
