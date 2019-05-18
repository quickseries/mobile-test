//
//  ContactInformationView.swift
//  Quickseries-iOS
//
//  Created by Thiago Magalhaes on 2019-05-18.
//  Copyright © 2019 Thiago Magalhaes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContactInformationView: InformationView {

    weak var delegate: ContactInformationViewDelegate?
    
    let bag = DisposeBag()
    
    var model: ContactInformationViewModel? {
        didSet {
            addFields()
        }
    }
    
    override var fieldLabelValue: String {
        get { return "CONTACT INFORMATION" }
        set { }
    }
    
    private func addFields() {
        if let model = model {
            if let email = model.email {
                let button = UIButton(type: .system)
                button.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
                    delegate?.onEmailClicked()
                }).disposed(by: bag)
                button.setImage(UIImage(named: "baseline_email_black_24pt"), for: .normal)
                let view = EmailFieldView(buttons: [button])
                view.fieldValue.text = email
                containerStackView.addArrangedSubview(view)
            }
            if let phoneNumber = model.phoneNumber {
                let callButton = UIButton(type: .system)
                callButton.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
                    delegate?.onCallPhoneNumberClicked()
                }).disposed(by: bag)
                callButton.setImage(UIImage(named: "baseline_call_black_24pt"), for: .normal)
                let smsButton = UIButton(type: .system)
                smsButton.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
                    delegate?.onSmsPhoneNumberClicked()
                }).disposed(by: bag)
                smsButton.setImage(UIImage(named: "baseline_textsms_black_24pt"), for: .normal)
                let view = TelephoneFieldView(buttons: [smsButton, callButton])
                view.fieldValue.text = phoneNumber
                containerStackView.addArrangedSubview(view)
            }
            if let faxNumber = model.faxNumber {
                let view = TelephoneFieldView(buttons: [])
                view.fieldValue.text = faxNumber
                containerStackView.addArrangedSubview(view)
            }
            if let tollFree = model.tollFree {
                let callButton = UIButton(type: .system)
                callButton.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
                    delegate?.onCallTollFreeClicked()
                }).disposed(by: bag)
                callButton.setImage(UIImage(named: "baseline_call_black_24pt"), for: .normal)
                let smsButton = UIButton(type: .system)
                smsButton.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
                    delegate?.onSmsTollFreeClicked()
                }).disposed(by: bag)
                smsButton.setImage(UIImage(named: "baseline_textsms_black_24pt"), for: .normal)
                let view = TollFreeFieldView(buttons: [smsButton, callButton])
                view.fieldValue.text = tollFree
                containerStackView.addArrangedSubview(view)
            }
            if let website = model.website {
                let button = UIButton(type: .system)
                button.rx.tap.asDriver().drive(onNext: { [weak delegate] _ in
                    delegate?.onWebsiteClicked()
                }).disposed(by: bag)
                button.setImage(UIImage(named: "baseline_open_in_browser_black_24pt"), for: .normal)
                let view = WebsiteFieldView(buttons: [button])
                view.fieldValue.text = website
                containerStackView.addArrangedSubview(view)
            }
        }
    }
}

protocol ContactInformationViewDelegate : AnyObject {
    func onEmailClicked()
    func onCallTollFreeClicked()
    func onCallPhoneNumberClicked()
    func onSmsTollFreeClicked()
    func onSmsPhoneNumberClicked()
    func onWebsiteClicked()
}
