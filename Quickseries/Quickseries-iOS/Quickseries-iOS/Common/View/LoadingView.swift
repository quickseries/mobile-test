//
//  LoadingView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import SnapKit

final class LoadingView: UIView {

    override var isHidden: Bool {
        didSet {
            isHidden ? activityIndicator.stopAnimating() : activityIndicator.startAnimating()
        }
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        return UIActivityIndicatorView(style: .gray)
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
