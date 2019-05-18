//
//  LoadingView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    override var isHidden: Bool {
        didSet {
            isHidden ? activityIndicator.stopAnimating() : activityIndicator.startAnimating()
        }
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        return UIActivityIndicatorView(style: .gray)
    }()
}
