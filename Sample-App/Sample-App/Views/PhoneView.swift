//
//  PhoneView.swift
//  Sample-App
//
//  Created by Israel Romero on 2020-04-16.
//  Copyright © 2020 Israel Romero. All rights reserved.
//

import UIKit

class PhoneView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var actionsStackView: UIStackView!
    var onMessage: (()->Void)?
    var onCall: (()->Void)?
    var isActionable: Bool = true {
        didSet {
            actionsStackView.isHidden = !isActionable
        }
    }
        
    @IBAction private func doMessage(_ sender: UIButton) {
        onMessage?()
    }
    
    @IBAction private func doCall(_ sender: UIButton) {
        onCall?()
    }
}
