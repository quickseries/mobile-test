//
//  ErrorView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit

class ErrorView: UIView {

    override var isHidden: Bool {
        didSet {
            messageLabel.isHidden = isHidden
        }
    }
    
    lazy var messageLabel: UILabel = {
        return UILabel(frame: .zero)
    }()
}
