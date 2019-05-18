//
//  AddressesView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddressesView: InformationView {
    
    weak var delegate: AddressesViewDelegate?
    
    private let bag = DisposeBag()
    
    var models: [AddressViewModel] = [] {
        didSet {
            addFields()
        }
    }
    
    override var fieldLabelValue: String {
        get { return "ADDRESSES" }
        set { }
    }
    
    private func addFields() {
        let views = models
            .map { address -> AddressFieldView in
                let button = UIButton(type: .system)
                button.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
                    delegate?.onAddressClicked(model: address)
                }).disposed(by: bag)
                 button.setImage(UIImage(named: "baseline_location_on_black_24pt"), for: .normal)
                let view = AddressFieldView(buttons: [button])
                view.fieldValue.text = address.address
                view.fieldValue.numberOfLines = 3
                return view
        }
        views.forEach({ containerStackView.addArrangedSubview($0) })
    }
}

protocol AddressesViewDelegate : AnyObject {
    
    func onAddressClicked(model: AddressViewModel)
}
