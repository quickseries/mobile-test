//
//  InfoCell.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol FieldViewDelegate : AnyObject {
    
    func onActionButtonClick(sender: UIButton)
}

class FieldView : UIView {

    var delegate: FieldViewDelegate?
    
    var fieldLabelValue = ""
    
    lazy var mainStack: UIStackView = {
        return UIStackView(arrangedSubviews: [innerLeadingStack, innerTrailingStack])
    }()
    
    lazy var innerLeadingStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [fieldLabel, fieldValue])
        stack.axis = .vertical
        return stack
    }()
    
    lazy var innerTrailingStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: actionButtons)
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var fieldLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = fieldLabelValue
        return label
    }()
    
    lazy var fieldValue: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    var actionButtons: [UIButton] = [] {
        didSet {
            innerTrailingStack.arrangedSubviews.forEach({ $0.removeFromSuperview() })
            actionButtons.forEach({ innerTrailingStack.addArrangedSubview($0) })
        }
    }
    
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
        addSubview(mainStack)
    }
    
    private func setupConstraints() {
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(safeAreaInsets)
            make.trailing.equalToSuperview().inset(safeAreaInsets)
            make.top.equalToSuperview().inset(safeAreaInsets)
            make.bottom.equalToSuperview().inset(safeAreaInsets)
        }
    }
    
    private func buildInnerLeadingStack() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [fieldLabel, fieldValue])
        stack.axis = .vertical
        return stack
    }
    
    private func buildInnerTrailingStack() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: actionButtons)
        stack.axis = .horizontal
        return stack
    }
}
