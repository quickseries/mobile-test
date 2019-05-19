//
//  EmailFieldView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit

final class EmailFieldView: FieldView {
    
    override var fieldLabelValue: String {
        get { return "EMAIL ADDRESS" }
        set { }
    }
    
    init(buttons: [UIButton]) {
        super.init(frame: .zero)
        self.actionButtons = buttons
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
