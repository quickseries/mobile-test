//
//  InformationView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit

class InformationView: UIView {
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, fieldsContainer])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    var fieldLabelValue: String = ""
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = fieldLabelValue
        return label
    }()
    
    lazy var fieldsContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var containerStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        fieldsContainer.addSubview(containerStackView)
        addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(layoutMargins)
        }
    }
}
