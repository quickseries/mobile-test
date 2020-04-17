//
//  SingleActionView.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-16.
//  Copyright © 2020 Israel Romero. All rights reserved.
//

import UIKit

class SingleActionView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    var isActionable: Bool = true {
        didSet {
            actionButton.isHidden = !isActionable
        }
    }
    var actionImage: UIImage? {
        didSet {
            actionButton.setImage(actionImage, for: .normal)
        }
    }
    var onAction: (()->Void)?
    
    
    @IBAction private func doAction(_ sender: UIButton) {
        onAction?()
    }
}
